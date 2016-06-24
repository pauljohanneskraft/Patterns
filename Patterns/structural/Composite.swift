
private protocol Component {}

private protocol Composite : Component {
    var children = [Component]()
}

private protocol Leaf : Component {}
