from chapter02.simpletokenizerv1 import SimpleTokenizerV1
from chapter02.simpletokenizerv2 import SimpleTokenizerV2
from chapter02.simpletokenizervTikTokenBPE import SimpleTokenizerTikTokenBPE
from chapter02.dataset import GPT2Dataset
from chapter02.vocabulary import Vocabulary

from collections import Dict, Set
from testing import assert_equal, assert_false, assert_raises, assert_true, TestSuite

from python import Python


def test_simple_tokenizerv1():
    var vocab = Dict[String, Int]()
    vocab["hello"] = 0
    vocab["world"] = 1
    var tokenizer = SimpleTokenizerV1(vocab)
    var encoded = tokenizer.encode("hello world")
    assert_equal(len(encoded), 2, "encoded length should be 2")
    assert_equal(encoded[0], 0, "first token should be 0 (hello)")
    assert_equal(encoded[1], 1, "second token should be 1 (world)")

def test_simple_tokenizerv2():
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

def test_vocab():
    var vocab = Vocabulary("hello world")
    assert_equal(vocab.vocab['hello'], 0, "hello should be 0")
    assert_equal(vocab.vocab['world'], 1, "world should be 1")
    assert_equal(len(vocab.vocab), 2, "vocab length should be 2")


def test_vocab_with_special_tokens():
    var vocab = Vocabulary("hello world", Set[String]("|unk|"))
    assert_equal(vocab.vocab['hello'], 0, "hello should be 0")
    assert_equal(vocab.vocab['world'], 1, "world should be 1")
    assert_equal(vocab.vocab['|unk|'], 2, "|unk| should be 2")
    assert_equal(len(vocab.vocab), 3, "vocab length should be 3")


def test_simple_tokenizervTikTokenBPE():
    var tokenizer = SimpleTokenizerTikTokenBPE()
    var encoded = tokenizer.encode("hello world")

    assert_equal(len(encoded), 2, "encoded length should be 2")
    assert_equal(encoded[0], 31373, "first token should be 0 (hello)")
    assert_equal(encoded[1], 995, "second token should be 1 (world)")

    var decoded = tokenizer.decode(encoded)
    assert_equal(decoded, "hello world", "decoded should be hello world")


def test_gpt2_dataset():
    var tokenizer = SimpleTokenizerTikTokenBPE()
    var dataset = GPT2Dataset("hello world portrait of Jack", tokenizer, 2, 1)


def main():
    TestSuite.discover_tests[__functions_in_module()]().run()
