from python import Python

fn main() raises:
    var tiktoken = Python.import_module("tiktoken")
    var tokenizer = tiktoken.get_encoding("gpt2")

    var special_tokens = Python.list() 
    special_tokens.append("special_token")
    var ids = tokenizer.encode("hello world", allowed_special=special_tokens)
    print(ids)
