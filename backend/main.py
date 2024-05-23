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
## Multiple-Choice Questions

1. What does the heuristic function \( h(n) \) represent in the context of Best-First Search algorithms?
   A) The actual cost from the start node to node \( n \)
   B) The estimated cost from node \( n \) to a goal node
   C) The total number of nodes in the search space
   D) The maximum depth of the search space
   **Answer: B) The estimated cost from node \( n \) to a goal node. This function helps the search algorithm estimate the cheapest path to the goal.**

2. In the context of adversarial search, what is a zero-sum game?
   A) A game where the sum of the points is zero at the start of the game.
   B) A game where no points are scored.
   C) A game where one player's gain is exactly balanced by the other's loss.
   D) A game where the game ends with zero points for both players.
   **Answer: C) A game where one player's gain is exactly balanced by the other's loss. This means each agent's gain or loss of utility is exactly balanced by the losses or gains of the utility of the other participant.**

3. Which algorithm combines the benefits of both Uniform-cost search and Greedy Best-First Search?
   A) A* Search
   B) Depth-first search
   C) Breadth-first search
   D) Hill-climbing search
   **Answer: A) A* Search. A* Search evaluates nodes by combining \( g(n) \), the cost to reach the node, and \( h(n) \), the cost to get from the node to the goal, giving the estimated total cost of the cheapest solution path through \( n \).**

## True/False Questions

4. The Greedy Best-First Search algorithm always provides the optimal solution to the problem.
   **Answer: False. Greedy Best-First Search is not optimal because it chooses the node that appears to be closest to the goal, possibly leading to longer paths in some scenarios.**

5. A heuristic is considered admissible if it never overestimates the true cost to reach the goal node from any node in the search space.
   **Answer: True. An admissible heuristic is optimistic and provides a cost estimate that is less than or equal to the actual minimum cost from the current node to the goal, ensuring that the search algorithm is optimal.**

6. The A* Search algorithm is complete and optimal if the heuristic function is admissible.
   **Answer: True. A* Search is complete and guarantees an optimal solution if the heuristic used is admissible, as it will not overestimate the cost to reach the goal.**

7. In a zero-sum game of adversarial search, increasing the search depth always leads to better performance of the algorithm.
   **Answer: False. Increasing search depth can improve the decision-making capability of the algorithm up to a certain extent; however, it also increases the computation time and may lead to diminishing returns in performance improvement.**

8. Genetic Algorithms use a population of solutions to evolve towards better solutions over generations.
   **Answer: True. Genetic Algorithms start with a randomly generated population of solutions and use operations like selection, crossover, and mutation to evolve solutions towards better fitness over successive generations.**

## Short Answer Questions

9. Explain the role of the evaluation function in the Minimax algorithm.
   **Answer: The evaluation function is used to assign a numerical value to the game states at the leaf nodes of the game tree. This value estimates the desirability of the game's outcome from the perspective of the maximizing player, helping determine the best possible move by backpropagating these values to the root of the tree.**

10. Describe how alpha-beta pruning enhances the Minimax algorithm.
   **Answer: Alpha-beta pruning enhances the Minimax algorithm by eliminating branches in the game tree that cannot possibly affect the final decision. This pruning happens by using two parameters, alpha and beta, which represent the minimum score that the maximizing player is assured and the maximum score that the minimizing player is assured, respectively. By pruning irrelevant branches, the algorithm reduces the number of nodes it evaluates, improving the efficiency and speed of the Minimax algorithm.**
           '''
exam = CourseExams(course= '0921-324')
exam.read()
print(exam.questions)
