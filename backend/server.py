from fastapi import FastAPI
from router.generator import router as Generator
from router.exams import router as Exams
from fastapi.middleware.cors import CORSMiddleware
app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"], 
    allow_headers=["*"],  
    allow_credentials=True,
)

API_VERSION = '/api/v1'
app.include_router(router=Generator, prefix=API_VERSION)
app.include_router(router= Exams, prefix=API_VERSION)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)