from max.tensor import Tensor, TensorShape, TensorSpec
from max.graph import Graph, TensorType, Type
from utils.index import Index
from max import engine
from python import Python
from memory.span import Span


fn graph_sample() raises:
    var graph = Graph(in_types=List[Type](TensorType(DType.float32, 1), TensorType(DType.float32, 1)))
    print(graph[0])
    graph.verify()

    var session = engine.InferenceSession()
    var model = session.load(graph)
    print("input names are:")
    for input_name in model.get_model_input_names():
        # Mojo lesson: `[]` dereferences in Mojo as `input_name` is of `Reference` type
        print(input_name[])

fn main() raises:

    # random tensor
    var rnd_tensor = Tensor[DType.float32].rand(TensorShape(1, 2, 2))
    print(rnd_tensor)

    var tensor = Tensor[DType.float32](TensorSpec(DType.float32, 2, 2))
    print(tensor)
    tensor[Index(1, 1)] = 1.0
    print(tensor)
    print(tensor[Index(1, 1)])

    var tensor2 = Tensor[DType.float32](TensorSpec(DType.float32, 2, 2))
    tensor2[Index(1, 1)] = 1.0
    print(tensor2)
    print(tensor * tensor2)

     
    var test_list = List[Int](1, 2, 3, 4, 5)

    

    var slice = Span(test_list)[3:4]
    print(slice._len)
    print(slice.__getitem__(0))
  
    var pytorch = Python.import_module("torch")
    var py_tensor = pytorch.tensor([1, 2, 3, 4, 5])
    print(py_tensor)





