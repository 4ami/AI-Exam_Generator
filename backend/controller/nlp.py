from sentence_transformers import SentenceTransformer, util
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
                                    #    num_return_sequences=1,
                                    #    temperature=1.5
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
        similarities = util.pytorch_cos_sim(new_embeddings, old_embeddings)
        return similarities
