
# AI Exam Generator
The AI Exam Generator is an advanced tool designed to assist educators in creating, validating, and distributing exams efficiently. Leveraging OpenAI's cutting-edge language models, this system automates the generation of diverse question types, including multiple-choice questions, true/false questions, and short answer formats.


## Features

- **Question Generation:** The system analyzes course materials (provided as text files, PDFs, or PowerPoint presentations) to automatically generate relevant questions. Each question is crafted to assess different cognitive levels, from basic recall to higher-order thinking.
- **Similarity Detection:** the system compares newly generated questions against a question bank to detect similarities. This feature ensures the uniqueness of each question and maintains the exam's integrity. the system will either paraphrase the question or generate a new one entirely.
- **Customization and Scalability:** Educators can specify parameters such as the number of questions, topics covered, and difficulty levels. The system adapts to these requirements, offering scalable solutions for both small classrooms and large educational institutions.
- **Cross platform**

## Benefits:

- **Efficiency:** Reduces the time and effort required to create exams.
- **Customizability:** Tailors exams specifically to course content and educational goals.
- **Accessibility:** Simplifies the exam creation process, making it accessible to all educators, regardless of their technical expertise.

---
This AI-powered exam generator represents a significant step forward in educational technology, combining the power of AI with the precision of NLP to revolutionize how exams are created and administered.

## Tech Stack

**Client:** Dart, Flutter

**Server:** Python, Fast-API


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`SECRET_KEY` 'OpenAI Secret Key'

`API` 'API Host'

`API_VERSION` 

`GPT_ENDPOINT`  'ENDPOINT of the API'
