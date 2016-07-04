
private protocol Component {}

private struct Composite : Component {
    var children = [Component]()
}

private struct Leaf : Component {}

// examples:
// 1 - Trees

protocol TreeComponent {}

struct TreeNode : TreeComponent {
    var right : TreeComponent
    var left  : TreeComponent
}

struct TreeLeaf : TreeComponent {}


// 2 - GUI-Elements
