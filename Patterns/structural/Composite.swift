
private protocol Component {}

<<<<<<< HEAD
private protocol Composite : Component {
    var children : [Component] { get }
}

private protocol Leaf : Component {}
=======
private struct Composite : Component {
    var children = [Component]()
}

private struct Leaf : Component {}

// examples:
// 1 - Trees



// 2 - GUI-Elements
>>>>>>> switch-to-XCTests
