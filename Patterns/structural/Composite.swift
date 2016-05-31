
protocol Component {}

struct Composite {
    var children = [Component]()
}

struct Leaf : Component {}
