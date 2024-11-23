from python import Python, PythonObject
from collections import Dict

# BPE (Byte Pair Encoding) Tokenizer
struct SimpleTokenizerBPE:
    var tiktoken: PythonObject
    
    def __init__(inout self):
        self.tiktoken = Python.import_module("tiktoken")

    def encode(self, text: String) -> List[Int]:
        var tokenizer = self.tiktoken.get_encoding("gpt2")
        var ids = tokenizer.encode(text, allowed_special=["<|endoftext|>"])
        return ids

    def decode(self, ids: List[Int]) -> String:
        var py_ids = Python.list()
        for i in ids:
            py_ids.append(i[])

        var tokenizer = self.tiktoken.get_encoding("gpt2")
        var word = tokenizer.decode(py_ids)
        return word.__str__()
