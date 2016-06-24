
private protocol Component {}

private protocol Composite : Component {
    var children : [Component] { get }
}

private protocol Leaf : Component {}
