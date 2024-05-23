import os
from dotenv import load_dotenv
import openai
class GPT_ExamGenerator:
    def __init__(self):
        load_dotenv()
        self.secret = os.getenv("SECRET_KEY")
        print(self.secret)
        return
    
    def _send(self, query:str)->str:
        openai.api_key = self.secret
        respnse = openai.chat.completions.create(
            model= "gpt-4-turbo",
            messages= [
                {"role":"system", "content": "You are a helpful assistant that generates exam questions."},
                {"role":"user", "content": query}
                ],
            max_tokens=1500,
            temperature= 0.7,
            n=1
        )
        return respnse.choices[0].message.content
    #- Questions required: {5} Multiple-choice (Difficulty: {1}), {3} True/False (Difficulty: {2}), {5} Short Answer (Difficulty: {3})
    def generate(self, content:str, requiredQs:str)->str:
        prompt = f"""
                You are an AI assistant helping an instructor generate an exam. Create a set of exam questions based on the following criteria:
                - Course content: {content}...
                {requiredQs} only no further questions.
                - Scan the entire content and identify the main topics.
                - From each topic provide two questions maximum.
                - Questions should be evenly distributed across different sections of the course material.
                - Questions must be about the main topics of the content.
                - Ensure the questions and answers are strictly based on the course content.
                - Adhere to the specified number and type of questions, each with the stated difficulty.
                - Format: Each type as specified: Multiple-choice, True/False, and Short Answer.
                - Provide answers for multiple-choice questions, True/False questions with explanation, and short answers questions based on the given content.
                - Clearly specify the question type and answer.
                - Result Formatting Guidelines:
                1- Add '##' Before each Question.
                2- Add '**' Before Answers and explainations.
                Start generating questions:
            """
        print("Prompt: ")
        print(prompt)
        exam = self._send(prompt)
        print(f"recived exam:\n{exam}")
        return exam
    
    def generateDifferent(self, content:str, requiredQs:str, old:list):
        
        prompt = f"""
         You are an AI assistant helping an instructor generate an exam. Create a set of exam questions based on the following criteria:
                - Course content: {content}...
                {requiredQs} only no further questions.
                - Old exams questions: {old} ...    
                - Scan the entire content and identify the main topics.
                - From each topic provide two questions maximum.
                - Questions should be evenly distributed across different sections of the course material.
                - Questions must be about the main topics of the content.
                - Ensure the questions and answers are strictly based on the course content.
                - Ensure the generated questions are different than old exams questions, either by paraphrase generated questions or replace them with new questions from the content.
                - Adhere to the specified number and type of questions, each with the stated difficulty.
                - Format: Each type as specified: Multiple-choice, True/False, and Short Answer.
                - Provide answers for multiple-choice questions, True/False questions with explanation, and short answers questions based on the given content.
                - Clearly specify the question type and answer.
                - Result Formatting Guidelines:
                1- Add '##' Before each Question.
                2- Add '**' Before Answers and explainations.
                Start generating questions:
        """
        print("Prompt: ")
        print(prompt)
        exam = self._send(prompt)
        print(f"recived exam:\n{exam}")
        return exam
        
