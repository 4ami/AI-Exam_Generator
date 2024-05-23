# from controller.content_process import ContentProcess
# from controller.gpt_exam_generator import GPT_ExamGenerator
# from controller.courses import CourseExams
# # def main():
# #     # pdf_example = "./content_set/221405477.pdf"
# #     pptx_example = "./content_set/Lecture 14.pptx"
    
# #     cp = ContentProcess()
# #     gpt = GPT_ExamGenerator()
    
# #     # pdf_text = cp.convertPDF(pdf_path= pdf_example)
# #     pptx_text = cp.convertPPTX(pptx_path= pptx_example)
# #     # print("Extracted PDF\n", pdf_text)
# #     print("Extracted PPTX\n", pptx_text)
    
# #     # cleaned_pdf = cp.clean(extracted= pdf_text)
# #     cleaned_pptx = cp.clean(extracted= pptx_text)
    
# #     # print("Cleaned PDF\n", cleaned_pdf)
# #     print("Cleaned PPTX\n", cleaned_pptx)
    
# #     gpt_respnse = gpt.generate(content= cleaned_pptx, difficulty='HARD', num_questions= 10)
# #     print(gpt_respnse)
# #     return

# # main()

# exams = CourseExams(course="0921-320")
# ex = """
#      **Question:** Which of the following is NOT a phase typically experienced by a virus?
#    A) Dormant
#    B) Propagation
#    C) Encryption
#    D) Execution
#    **Answer:** C) Encryption - The typical phases of a virus include dormant, propagation, triggering, and execution, but not encryption.

# 2. **Question Type: True/False**
#    **Question:** A rootkit is primarily used for creating copies of itself and spreading to other computers.
#    **Answer:** False. A rootkit is used to gain root-level access and hide its presence on the system, not for propagating itself.

# 3. **Question Type: Multiple Choice**
#    **Question:** What type of malware is specifically designed to take advantage of a zero-day exploit?
#    A) Virus
#    B) Worm
#    C) Trojan Horse
#    D) Backdoor
#    **Answer:** B) Worm - Worms can be designed to exploit zero-day vulnerabilities to achieve maximum surprise and distribution.

# 4. **Question Type: Short Answer**
#    **Question:** Explain the function of a polymorphic virus.
#    **Answer:** A polymorphic virus recreates itself with a different signature each time it infects a new system, which helps it evade detection by signature-based antivirus systems.

# 5. **Question Type: True/False**
#    **Question:** Mobile code can only execute on the platform for which it was originally designed.
#    **Answer:** False. Mobile code is designed to move unchanged to heterogeneous platforms, meaning it can execute across different systems.

# 6. **Question Type: Multiple Choice**
#    **Question:** Which malware countermeasure approach involves analyzing the behavior and structure of new malware to prevent its spread?
#    A) Simple Scanner
#    B) Heuristic Scanner
#    C) Digital Immune System
#    D) Full-featured protection
#    **Answer:** C) Digital Immune System - This system detects new malware, analyzes it, and shares the prevention measures across networks before it can do harm.

# 7. **Question Type: Multiple Choice**
#    **Question:** Which of the following is NOT a use of botnets?
#    A) Spamming
#    B) Encrypting data
# by signature-based scanning.

# 10. **Question Type: Multiple Choice**
#     **Question:** What is a key characteristic of a metamorphic virus?
#     A) It encrypts its code
#     B) It remains inactive until a specific event occurs
#     C) It changes its code and behavior to evade detection
#     D) It propagates via email attachments
#     **Answer:** C) It changes its code and behavior to evade detection - Metamorphic viruses can alter both their code and operational behavior to avoid being detected by conventional antivirus method

#      """
# # exams.write(exam=ex)
# exams.read()
# sim = exams.check_similarities(newQs= ex)
# for i in sim:
#     print(i)
#     print(f'Paraphrased: {exams.paraphrase(i[0])}')
