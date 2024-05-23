from fastapi import APIRouter, HTTPException, File, UploadFile, Form
from controller.gpt_exam_generator import GPT_ExamGenerator
from view.generate_request import GenerateRequestModel
from controller.content_process import ContentProcess
from fastapi.responses import FileResponse
from controller.courses import CourseExams
from typing import List
import shutil
import json
import os
router = APIRouter()

@router.post('/generate')
async def generate(request: str = Form(...), content: List[UploadFile] = File(...)):
    try:
        print('Start')
        data = json.loads(request) # parse serialized request to json
        model = GenerateRequestModel(**data) # validate request sent
        # Pre-Process
            # Check if course in 'question_bank'
            # if it is not then absolutly there won't be similar questions
            # otherwise continue service routein
        res = {}
        courseExams = CourseExams(course=model.course)
        old_exams = ''
        if not courseExams.reader.check_path():
            res["similarity"] = False
            os.makedirs(f"{courseExams.reader.root}/{model.course}")
        else:
            res["similarity"] = True
            courseExams.read()
            old_exams = courseExams.questions
        print('Similarity: Done !')
        # Process: 
            #1- check if content recieved
        if len(content) == 0:
            raise HTTPException(status_code=404, detail="There is no content to process within the request!")
        
            #2- process the content [convert to text, clean them]
            #3- store the content in 'content_set' directory
        contentProcess = ContentProcess()
        contentPromt = []
        for i, file in enumerate(content):
            contentPromt.append(f'content number {i+1}\n')
            path = os.path.join('./content_set', file.filename)
            if not os.path.exists(path=path):
                with open(path, 'wb') as buffer:
                    shutil.copyfileobj(file.file, buffer)
            if file.filename.endswith('.pdf'):
                contentPromt[i] += contentProcess.convertPDF(pdf_path=path)
            else:
                contentPromt[i] += contentProcess.convertPPTX(pptx_path=path)
        cleanedContent = ''.join(contentPromt)
        cleanedContent = contentProcess.clean(cleanedContent)    
        print('Content Process: Done !')

            #4- check the request body {question types, number of questions, difficulity of questions}
        if not model.questions:
            raise HTTPException(status_code=404, detail="No questions specified to generate")
            #5- prepare the content and variables, and prepare the prompt
                # - Questions required: {5} Multiple-choice (Difficulty: {1}), {3} True/False (Difficulty: {2}), {5} Short Answer (Difficulty: {3})
        questionsRequired = "- Questions required:"
        if model.questions.MCQ:
            questionsRequired += f' Multiple-choice (Difficulty: {model.questions.MCQ.difficulty}, Number of questions: {model.questions.MCQ.number_of_questions}),'
        
        if model.questions.TF:
            questionsRequired += f' True/False (Difficulty: {model.questions.TF.difficulty}, Number of questions: {model.questions.TF.number_of_questions}),'
        
        if model.questions.ShortAnswer:
            questionsRequired += f' Short Answer (Difficulty: {model.questions.ShortAnswer.difficulty}, Number of questions: {model.questions.ShortAnswer.number_of_questions})'
            
        if questionsRequired.endswith(','):
            questionsRequired = questionsRequired[:-1]

        print('Questions: Done !')
            #6- send GPT request to generate questions
        gpt = GPT_ExamGenerator()
        
        exam = ''
        if old_exams:
            exam = gpt.generateDifferent(content=cleanedContent, requiredQs=questionsRequired, old= old_exams)
        else:
            exam = gpt.generate(content=cleanedContent, requiredQs=questionsRequired)
        print('Generate: Done !')

        # #     7- prepare exam {structure it in docx format}
        document_path, document_name = courseExams.write(exam=exam)
        # #     8- return the docx file, and tell whether there is similarity with 'question_bank'
        response = FileResponse(path=document_path, filename=document_name, media_type='application/vnd.openxmlformats-officedocument.wordprocessingml.document', status_code=201)
        response.headers['X-similarity'] = str(res['similarity'])
        return response
    except Exception as e:
        return HTTPException(status_code=500, detail=f"Unexpected Error:\n{e}")