
private protocol Visitor {
    func visit(_ element: VisitorElement)
}

private protocol VisitorElement {
    func accept(_ visitor: Visitor)
}

extension VisitorElement {
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}