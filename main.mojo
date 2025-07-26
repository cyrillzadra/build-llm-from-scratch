from python import Python, PythonObject
from collections import InlineArray
from collections import Set
from collections import Dict

from chapter02.simpletokenizerv1 import SimpleTokenizerV1
from chapter02.simpletokenizervTikTokenBPE import SimpleTokenizerTikTokenBPE

fn download_file() raises -> None:
    # mojo has no http client library, which supports tls.
    # so i decided to use python's requests library.

    var requests = Python.import_module("requests")
    var url = "https://raw.githubusercontent.com/rasbt/LLMs-from-scratch/main/ch02/01_main-chapter-code/the-verdict.txt"
    var response = requests.get(url)

    with open("the-verdict.txt", "w") as f:
        try:
            f.write(String(response.text))
        except e:
            print(e)

    print("File downloaded and saved successfully")

fn read_file() raises -> String:
    with open("the-verdict.txt", "r") as f:
        return f.read()

fn split_text(text: String) raises -> List[String]:
    var re = Python.import_module("re")
    var tokens = re.split(r'([,.:;?_!"()\']|--|\s)', text)
    var result = List[String]()

    for i in range(tokens.__len__()):
        var item = tokens.__getitem__(i)
        var stripped_item = String(item).strip()
        if len(stripped_item) > 0:
            result.append(String(stripped_item))

    return result

def print_list(list: List[String]):
    print(list.__str__())

def print_set(set: Set[String], count: Int):
    var counter = 0
    for item in set:
        print(item, end=",")
        counter += 1
        if counter > count:
            break
    if counter < count:
        print("Count is less than the number of elements in the set")

fn create_dictionary(tokens: List[String]) -> Set[String]:
    var sorted_token_set = Set[String]()
    for t in range(len(tokens)):
        sorted_token_set.add(String(tokens[t]))
    return sorted_token_set^

fn create_vocabulary(tokens: Set[String]) -> Dict[String, Int]:
    var vocabulary = Dict[String, Int]()
    var counter = 0
    for t in tokens:
        vocabulary[String(t)] = counter
        counter += 1
    return vocabulary

fn main():
    try:
        download_file()
        var raw_text = read_file()
        print("Total number of characters in the file: ", len(raw_text))
#        print(raw_text[:99])

#        var result = raw_text.split('\n')
#        print(len(result))

        var tokens = split_text(raw_text)
#        print_list(tokens)
#        print(len(tokens))
        for i in range(30):
            print(tokens[i], sep="", end=",")
#        sort(tokens)
        var sorted_token_set = create_dictionary(tokens)
        print("Dictionary size: ", sorted_token_set.__len__())


        var vocabulary = create_vocabulary(sorted_token_set)


#        print_set(sorted_token_set, 50)

#        print(vocabulary.__str__())

        var tokenizer = SimpleTokenizerV1(vocabulary)
        print("tokenizer created")
        print(vocabulary['Jack'])

        var encoded = tokenizer.encode(""""It's the last he painted, you know,"
       Mrs. Gisburn said with pardonable pride.""")
        print(encoded.__str__())

        var decoded = tokenizer.decode(encoded)
        print(decoded)

        var verdict_raw_text = read_file()
        var tiktokenTokenizer = SimpleTokenizerTikTokenBPE()
        var enc_text = tiktokenTokenizer.encode(verdict_raw_text)
        print(len(enc_text))

    except e:
        print(e)
