from pydantic import BaseModel, Field
from typing import Optional

class Question(BaseModel):
    number_of_questions:int = Field(..., example=10, description="Number of questions per type")
    difficulty:str = Field(..., example="Hard", description="Difficulty of questions per type")

class Questions(BaseModel):
    MCQ:Optional[Question] = Field(None, exclude={"number_of_questions":4, "difficulty": "Easy"})
    TF:Optional[Question] = Field(None, exclude={"number_of_questions":2, "difficulty": "Hard"})
    ShortAnswer:Optional[Question] = Field(None, exclude={"number_of_questions":3, "difficulty": "Medium"})

class GenerateRequestModel(BaseModel):
    course:str = Field(..., example="0921-320", description="The course identifier.")
    questions:Questions = Field(..., description="Container for different types of questions.")