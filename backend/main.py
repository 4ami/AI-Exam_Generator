from controller.content_process import ContentProcess
from controller.gpt_exam_generator import GPT_ExamGenerator
from controller.courses import CourseExams
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

response = '''
           ### Multiple-Choice Questions (Easy)

1. **What is a zero-sum game as discussed in adversarial search in AI?**
   - A) A game where one player's gain does not affect the other's loss.
   - B) A game where both players have unlimited resources.
   - C) A game where one player's gain is exactly balanced by the losses of another.
   - D) A game where players do not compete but cooperate.

   **Answer: C) A game where one player's gain is exactly balanced by the losses of another.**

2. **In the context of AI, what does the Minimax algorithm do?**
   - A) It minimizes the maximum possible loss for a worst-case scenario.
   - B) It maximizes the minimum gain from the available choices.
   - C) Both A and B.
   - D) It chooses the first available move without any calculation.

   **Answer: C) Both A and B.**

### True/False Questions (Medium)

3. **True/False: The utility values at the end of a zero-sum game are always equal and opposite.**
   - **Answer: True.** Explanation: In zero-sum games, the gain or loss of utility is exactly balanced by the losses or gains of the utility of the other participant, making the utility values at the end of the game equal and opposite.

4. **True/False: Alpha-beta pruning returns a different result compared to the Minimax algorithm.**
   - **Answer: False.** Explanation: Alpha-beta pruning enhances the Minimax algorithm by eliminating branches that cannot possibly influence the final decision, thus optimizing performance without altering the result.

### Short Answer Questions (Hard)

5. **Explain the role of the evaluation function in the Minimax algorithm.**
   - **Answer:** In the Minimax algorithm, the evaluation function is used to assess the desirability of a game's position. At terminal nodes of the game tree, it assigns a numerical value to the end states, which helps in backpropagating the values to determine the optimal gameplay strategy.

6. **Describe how a game tree is utilized in adversarial AI games.**
   - **Answer:** A game tree in adversarial AI games represents all possible moves from a given initial state, branching out according to the possible moves of each player (MAX and MIN). Each node in the tree represe
           
           
           '''
exam = CourseExams(course= '0921-324')
exam.read()
ls = exam.check_similarities(response)
print(exam.questions)
# for i in ls:
#    print(i)