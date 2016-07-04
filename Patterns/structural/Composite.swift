
private protocol Component {}

private struct Composite : Component {
    var children = [Component]()
}

private struct Leaf : Component {}

// examples:
// 1 - Trees



// 2 - GUI-Elements
