
private protocol Client {
    var adapter : Adapter { get }
}

private protocol Adapter {
    var adaptee : Adaptee { get }
}

extension Adapter {
    func execute() { adaptee.op() }
}

private protocol Adaptee {
    func op()
}



