from python import Python, PythonObject
from collections import Dict

struct SimpleTokenizerV2:
    var re: PythonObject
    var str_to_int: Dict[String, Int]
    var int_to_str: Dict[Int, String]

    def __init__(inout self, vocab: Dict[String, Int]):
        self.re = Python.import_module("re")
        self.str_to_int = vocab

        var tmp_int_to_str = Dict[Int, String]()
        for e in vocab.items():
            tmp_int_to_str[e[].value] = e[].key
        self.int_to_str = tmp_int_to_str