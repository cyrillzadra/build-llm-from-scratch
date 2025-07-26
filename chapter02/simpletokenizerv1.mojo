
from python import Python, PythonObject
from collections import Dict
from utils import StringSlice

struct SimpleTokenizerV1:
    var re: PythonObject
    var str_to_int: Dict[String, Int]
    var int_to_str: Dict[Int, String]

    def __init__(out self, vocab: Dict[String, Int]):
        self.re = Python.import_module("re")
        self.str_to_int = vocab

        var tmp_int_to_str = Dict[Int, String]()
        for e in vocab.items():
            tmp_int_to_str[e.value] = e.key
        self.int_to_str = tmp_int_to_str

    def encode(self, text: String) -> List[Int]:
        var preprocessed = self.__split_text__(text)
        var ids = List[Int]()
        for s in preprocessed:
            if s in self.str_to_int:
                ids.append(self.str_to_int[s])
        return ids

    def decode(self, ids: List[Int]) -> String:
        var words = List[String]()
        for i in ids:
            var word = self.int_to_str[i]
            words.append(word)
        return " ".join(words)

    def __split_text__(self, text: String) -> List[String]:
        var preprocessed = self.re.split(r'([,.?_!"()\']|--|\s)', text)

        var result = List[String]()

        for i in range(preprocessed.__len__()):
            var item = preprocessed.__getitem__(i)
            var stripped_item = String(item).strip()
            if len(stripped_item) > 0:
                result.append(String(stripped_item))

        return result


fn main() raises:
    var vocab = Dict[String, Int]()
    vocab["hello"] = 0
    vocab["world"] = 1
    var tokenizer = SimpleTokenizerV1(vocab)
    var encoded = tokenizer.encode("hello world")
    print(encoded.__str__())
