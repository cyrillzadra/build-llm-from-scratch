from python import Python, PythonObject
from collections import Dict

# BPE (Byte Pair Encoding) Tokenizer
struct SimpleTokenizerTikTokenBPE:
    var tiktoken: PythonObject
    var tokenizer: PythonObject

    def __init__(out self):
        self.tiktoken = Python.import_module("tiktoken")
        self.tokenizer = self.tiktoken.get_encoding("gpt2")

    def encode(self, text: String) -> List[Int]:
        var  python_set= Python.evaluate("set")
        var special_tokens = python_set()
        special_tokens.add("<|endoftext|>")
        var ids = self.tokenizer.encode(text, allowed_special=special_tokens)

        var result = List[Int]()
        for i in range(ids.__len__()):
            var item = ids.__getitem__(i)
            result.append(Int(item))

        return result.copy()

    def decode(self, ids: List[Int]) -> String:
        var ids_set = Python.list()
        for i in ids:
            ids_set.append(i)

        var word = self.tokenizer.decode(ids_set)
        return String(word.__str__())
