from chapter02.simpletokenizervTikTokenBPE import SimpleTokenizerTikTokenBPE
from memory.span import Span

from python import Python

struct GPT2Dataset:


    def __init__(out self, text: String, tokenizer: SimpleTokenizerTikTokenBPE, max_length: Int, stride: Int):

        var token_ids = tokenizer.encode(text)
        var torch = Python.import_module("torch")
        var a = torch.randn(4, 2)
        var b = torch.randn(2, 2)
   #         let c = a * b
       # var tensor = torch.tensor([0.5])
       # print(tensor)


        # for i in range(0, len(token_ids) - max_length, stride):
        #     input_chunk = token_ids[i:i + max_length]
        #     target_chunk = token_ids[i + 1: i + max_length + 1]
        #     self.input_ids.append(torch.tensor(input_chunk))
        #     self.target_ids.append(torch.tensor(target_chunk))

        #var tensor = Tensor[DType.float32](TensorShape(2, 2))
        #print(tensor)
        for i in range(0, len(token_ids) - max_length, stride):
            #print(token_ids[i])
            var input_chunk = Span(token_ids)[i:i + max_length]
            var target_chunk = Span(token_ids)[i + 1: i + max_length + 1]
            #print(input_chunk._len)
            #print(target_chunk._len)
