from sentence_transformers import SentenceTransformer, util
import torch
from transformers import PegasusTokenizer, PegasusForConditionalGeneration
import re
class _ParaphraseModel:
    def __init__(self):
        model_name = 'tuner007/pegasus_paraphrase'
        self.tokenizer = PegasusTokenizer.from_pretrained(model_name)
        self.model = PegasusForConditionalGeneration.from_pretrained(model_name)
        return
    def paraphrase(self,q:str)->str:
        q = self.prepare_sentence(text=q)
        encoded = self.tokenizer([q], truncation=True, padding='longest', max_length=60, return_tensors="pt")
        generated_tokens = self.model.generate(**encoded, 
                                       max_length=60, 
                                       num_beams=10,
                                       num_return_sequences=1,
                                       temperature=1.5
                                       )
        paraphrased = [self.tokenizer.decode(output, skip_special_tokens=True) for output in generated_tokens]
        return paraphrased

    def prepare_sentence(self, text:str)->str:
        prepared = text.lower()
        prepared = re.sub(r'\d+', '', prepared)
        prepared = re.sub(r'[^\w\s]', '', prepared)
        prepared = re.sub(r'\s+', ' ', prepared).strip()
        return prepared
    
class NLP:
    def __init__(self):
        self.nlp = SentenceTransformer('all-MiniLM-L6-v2')
        self.PM = _ParaphraseModel()
        return
    def isSimilar(self, newQ:str, oldQ:str):
        
        new_embeddings = self.nlp.encode(newQ, convert_to_tensor=True)
        old_embeddings = self.nlp.encode(oldQ, convert_to_tensor=True)
        print(new_embeddings)
        print(old_embeddings)
        # Check if embeddings are tensors and print their shapes
        # if not isinstance(new_embeddings, torch.Tensor) or not isinstance(old_embeddings, torch.Tensor):
        #     raise ValueError("Embeddings must be PyTorch tensors.")
        # print(f"New embeddings shape: {new_embeddings.shape}")
        # print(f"Old embeddings shape: {old_embeddings.shape}")

        # # Check for empty tensors
        # if new_embeddings.nelement() == 0 or old_embeddings.nelement() == 0:
        #     raise ValueError("One of the embeddings is empty.")
        # similarities = util.pytorch_cos_sim(new_embeddings, old_embeddings)
        # return similarities.item()
