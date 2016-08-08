
private protocol Component {}

private protocol _Composite : Component {
    var children : [Component] { get }
}

private protocol _Leaf : Component {}

// examples:
// 1 - Trees

protocol TreeComponent {}

struct TreeNode : TreeComponent {
    var right : TreeComponent
    var left  : TreeComponent
}

struct TreeLeaf : TreeComponent {}


// 2 - GUI-Elements
