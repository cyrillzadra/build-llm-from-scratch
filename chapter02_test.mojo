from chapter02.simpletokenizerv1 import SimpleTokenizerV1
from chapter02.simpletokenizerv2 import SimpleTokenizerV2
from chapter02.simpletokenizervTikTokenBPE import SimpleTokenizerTikTokenBPE

from chapter02.vocabulary import Vocabulary
from collections import Dict, Set
from testing import assert_true, assert_equal
from python import Python
fn test[name: String, test_fn: fn () raises -> object]() raises:
    var name_val = name  # FIXME(#26974): Can't pass 'name' directly.
    print("Test -> ", name_val, "...", end="")
    try:
        _ = test_fn()
    except e:
        print("FAIL ")
        raise e
    print("PASS ")


fn test_simple_tokenizerv1() raises -> object:
    var vocab = Dict[String, Int]()
    vocab["hello"] = 0
    vocab["world"] = 1
    var tokenizer = SimpleTokenizerV1(vocab)
    var encoded = tokenizer.encode("hello world")
    assert_equal(len(encoded), 2, "encoded length should be 2")
    assert_equal(encoded[0], 0, "first token should be 0 (hello)")
    assert_equal(encoded[1], 1, "second token should be 1 (world)")
    return 0

fn test_simple_tokenizerv2() raises -> object:
    var vocab = Dict[String, Int]()
    vocab["hello"] = 0
    vocab["world"] = 1
    vocab["|unk|"] = 2
    var tokenizer = SimpleTokenizerV2(vocab)
    var encoded = tokenizer.encode("hello unknown world")
    assert_equal(len(encoded), 3, "encoded length should be 3")
    assert_equal(encoded[0], 0, "first token should be 0 (hello)")
    assert_equal(encoded[1], 2, "second token should be 2 (unk)")
    assert_equal(encoded[2], 1, "third token should be 1 (world)")
    return 0

fn test_vocab() raises -> object:
    var vocab = Vocabulary("hello world")
    assert_equal(vocab.vocab['hello'], 0, "hello should be 0")
    assert_equal(vocab.vocab['world'], 1, "world should be 1")
    assert_equal(len(vocab.vocab), 2, "vocab length should be 2")
    return 0

fn test_vocab_with_special_tokens() raises -> object:
    var vocab = Vocabulary("hello world", Set[String]("|unk|"))
    assert_equal(vocab.vocab['hello'], 0, "hello should be 0")
    assert_equal(vocab.vocab['world'], 1, "world should be 1") 
    assert_equal(vocab.vocab['|unk|'], 2, "|unk| should be 2")
    assert_equal(len(vocab.vocab), 3, "vocab length should be 3")
    return 0

fn test_simple_tokenizervTikTokenBPE() raises -> object:
    var tokenizer = SimpleTokenizerTikTokenBPE()
    var encoded = tokenizer.encode("Hello world")
    print(encoded.__str__())
    assert_equal(len(encoded), 2, "encoded length should be 2")
    assert_equal(encoded[0], 0, "first token should be 0 (hello)")
    assert_equal(encoded[1], 1, "second token should be 1 (world)")
    return 0

fn main() raises:
    test["test_simple_tokenizerv0", test_simple_tokenizerv1]()
    test["test_simple_tokenizerv2", test_simple_tokenizerv2]()
    test["test_vocab", test_vocab]()
    test["test_vocab_with_special_tokens", test_vocab_with_special_tokens]()
    test["test_simple_tokenizervTikTokenBPE", test_simple_tokenizervTikTokenBPE]()
