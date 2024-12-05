from python import Python, PythonObject
from collections import Dict

# BPE (Byte Pair Encoding) Tokenizer
struct SimpleTokenizerTikTokenBPE:
    var tiktoken: PythonObject
    
    def __init__(inout self):
        self.tiktoken = Python.import_module("tiktoken")

    def encode(self, text: String) -> List[Int]:
        print("SimpleTokenizerTikTokenBPE.encode")
        var tokenizer = self.tiktoken.get_encoding("gpt2")
        var  python_set= Python.evaluate("set")
        var special_tokens = python_set(['<|endoftext|>'])
        print(special_tokens.__str__())
        print(text)
        var ids = tokenizer.encode(text, allowed_special=special_tokens)
        return ids

    def decode(self, ids: List[Int]) -> String:
        #var py_ids = Python.list()
        print("SimpleTokenizerTikTokenBPE.decode")
        var py_ids = Python.evaluate("set")

        for i in ids:
            py_ids.add(i[])

        var tokenizer = self.tiktoken.get_encoding("gpt2")
        var word = tokenizer.decode(py_ids)
        print(word)
        return word.__str__()
