
private protocol Component {}

private struct Composite {
    var children = [Component]()
}

private struct Leaf : Component {}
