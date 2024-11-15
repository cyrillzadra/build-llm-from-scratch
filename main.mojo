from python import Python

fn download_file() raises -> None:
    # mojo has no http client library, which supports tls.
    # so i decided to use python's requests library.

    var requests = Python.import_module("requests")
    var url = "https://raw.githubusercontent.com/rasbt/LLMs-from-scratch/main/ch02/01_main-chapter-code/the-verdict.txt"
    var response = requests.get(url)

    with open("output.txt", "w") as f:
        try:
            f.write(str(response.text))
        except e:
            print(e)

    print("File downloaded and saved successfully")

fn main():
    try:
        download_file()
    except e:
        print(e)
