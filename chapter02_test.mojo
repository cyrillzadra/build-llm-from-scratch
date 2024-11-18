from chapter02.simpletokenizerv1 import SimpleTokenizerV1
from collections import Dict
from testing import assert_true, assert_equal

fn test[name: String, test_fn: fn () raises -> object]() raises:
    var name_val = name  # FIXME(#26974): Can't pass 'name' directly.
    print("Test", name_val, "...", end="")
    try:
        _ = test_fn()
    except e:
        print("FAIL")
        raise e
    print("PASS ", name_val)


fn test_basic() raises -> object:
    var vocab = Dict[String, Int]()
    vocab["hello"] = 0
    vocab["world"] = 1
    var tokenizer = SimpleTokenizerV1(vocab)
    var encoded = tokenizer.encode("hello world")
    assert_equal(len(encoded), 2, "encoded length should be 2")
    assert_equal(encoded[0], 0, "first token should be 0")
    assert_equal(encoded[1], 1, "second token should be 1")
    return 0

fn main() raises:
    test["test_basic", test_basic]()
