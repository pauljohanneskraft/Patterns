
private protocol Client {
    var domain : Abstraction { get }
}

private protocol Abstraction {
    var imp : Implementor { get }
}

private extension Abstraction {
    func op() { imp.op() }
}

private protocol Implementor {
    func op()
}