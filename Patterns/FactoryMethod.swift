
private protocol Product {}

private struct Product1 : Product {}

private struct Product2 : Product {}

private protocol Factory {
    func produce() -> Product
}

private protocol Factory1 : Factory {}

extension Factory1 {
    func op() -> Product {
        return Product1()
    }
}

private protocol Factory2 : Factory {}

extension Factory2 {
    func op() -> Product {
        return Product2()
    }
}
