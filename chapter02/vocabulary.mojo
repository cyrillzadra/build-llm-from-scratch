from collections import Dict, Set, List
from python import Python


struct Vocabulary:
    var vocab: Dict[String, Int]
    var raw_vocab: String

    fn __init__(out self, raw_vocab: String, special_tokens: Set[String] = Set[String]()):
        self.raw_vocab = raw_vocab
        try:
            self.vocab = Dict[String, Int]()
            self.vocab = self.__build_vocab__(special_tokens)
        except e:
            print(e)

    fn __build_vocab__(self, special_tokens: Set[String]) raises -> Dict[String, Int]:
        var vocab = Dict[String, Int]()
        var words = self.__split_text__(self.raw_vocab)

        var sorted_token_set = Set[String]()
        for w in words:
            sorted_token_set.add(w[])
        for s in special_tokens:
            sorted_token_set.add(s[])

        var counter = 0
        for t in sorted_token_set:
            vocab[t[]] = counter
            counter += 1

        return vocab

    fn __split_text__(self, text: String) raises -> List[String]:
        var re = Python.import_module("re")
        var tokens = re.split(r'([,.:;?_!"()\']|--|\s)', text) 
        var result = List[String]()
        
        for i in range(tokens.__len__()):
            var item = tokens.__getitem__(i)
            var stripped_item = String(item).strip()
            if len(stripped_item) > 0:  
                result.append(String(stripped_item))

        return result


