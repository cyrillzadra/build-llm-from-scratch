from chapter02.simpletokenizervTikTokenBPE import SimpleTokenizerTikTokenBPE
from max.tensor import Tensor, TensorShape

struct GPT2Dataset:

    def __init__(inout self, text: String, tokenizer: SimpleTokenizerTikTokenBPE, max_length: Int, stride: Int):

        var token_ids = tokenizer.encode(text)

        var tensor = Tensor[DType.float32](TensorShape(2, 2))

        for i in range(0, len(token_ids) - max_length, stride):
            print(token_ids[i])
