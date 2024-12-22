from chapter02.simpletokenizervTikTokenBPE import SimpleTokenizerTikTokenBPE
from max.tensor import Tensor, TensorShape
from memory.span import Span
from python import Python

struct GPT2Dataset:

    def __init__(inout self, text: String, tokenizer: SimpleTokenizerTikTokenBPE, max_length: Int, stride: Int):
        var pytorch = Python.import_module("pytorch")

        var tensor = pytorch.tensor([1, 2, 3, 4, 5])
        print(tensor)

        var token_ids = tokenizer.encode(text)

        # for i in range(0, len(token_ids) - max_length, stride):
        #     input_chunk = token_ids[i:i + max_length]
        #     target_chunk = token_ids[i + 1: i + max_length + 1]
        #     self.input_ids.append(torch.tensor(input_chunk))
        #     self.target_ids.append(torch.tensor(target_chunk))

        var tensor = Tensor[DType.float32](TensorShape(2, 2))
        print(tensor)
        for i in range(0, len(token_ids) - max_length, stride):
            print(token_ids[i])
            var input_chunk = Span(token_ids)[i:i + max_length]
            var target_chunk = Span(token_ids)[i + 1: i + max_length + 1]
            print(input_chunk._len)
            print(target_chunk._len)
