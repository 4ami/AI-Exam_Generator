from fastapi import APIRouter, HTTPException
from fastapi.responses import FileResponse
from controller.courses import CourseExams
import os
router = APIRouter()

@router.get('/question_bank')
def get_course_exams():
    try:
        return FileResponse(path='question_bank/0921-324/0921-324-e5.docx', filename='0921-324-e5.docx',
                            media_type='application/vnd.openxmlformats-officedocument.wordprocessingml.document', 
                            status_code=200)
    except Exception as e:
        print(f"Error {e}")
    return