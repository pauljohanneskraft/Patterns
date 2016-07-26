
private protocol Component {}

private protocol _Composite : Component {
    var children : [Component] { get }
}

private protocol _Leaf : Component {}

private struct Composite : Component {
    var children = [Component]()
}

private struct Leaf : Component {}

// examples:
// 1 - Trees



// 2 - GUI-Elements
