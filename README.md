# build llm from scratch

## references

Book -  https://livebook.manning.com/book/build-a-large-language-model-from-scratch
Github - https://github.com/rasbt/LLMs-from-scratch

Mojo Documentation - https://docs.modular.com/mojo/manual/

## requirements

- use mojo language

## possible todos

- implement a mojo tokenizer (https://github.com/dorjeduck/minbpe.mojo)
- 

## cheatsheet

how to add a new python module with magic cli

```
magic add tiktoken
```

libblas = { version = ">=3.9.0,<4", build = "*mkl" }

## pytorch 

Unhandled exception caught during execution: libmkl_intel_lp64.so.2: cannot open shared object file: No such file or directory

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.magic/envs/default/lib


