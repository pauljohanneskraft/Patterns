
// use case


private protocol SubSystem1 {
    func op1()
}

private protocol SubSystem2 {
    func op2()
}

private protocol Facade {
    var sub1 : SubSystem1 { get }
    var sub2 : SubSystem2 { get }
}
extension Facade {
    func op() {
        sub1.op1()
        sub2.op2()
    }
}