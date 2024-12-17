from max.tensor import Tensor, TensorShape, TensorSpec
from max.graph import Graph, TensorType, Type
from utils.index import Index
from max import engine

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


    var test_list = List[Int](1, 2, 3, 4, 5)
    print(test_list[1])
    #graph_sample()





