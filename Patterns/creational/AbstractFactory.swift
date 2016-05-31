
private protocol AbstractFactory {
    func createProduct1() -> Product1
    func createProduct2() -> Product2
}

private protocol Product1 {}
private   struct Product1a : Product1 {}
private   struct Product1b : Product1 {}

private protocol Product2 {}
private   struct Product2a : Product2 {}
private   struct Product2b : Product2 {}

private struct FactoryA : AbstractFactory {
    func createProduct1() -> Product1 {
        return Product1a()
    }
    func createProduct2() -> Product2 {
        return Product2a()
    }
}

private struct FactoryB : AbstractFactory {
    func createProduct1() -> Product1 {
        return Product1b()
    }
    func createProduct2() -> Product2 {
        return Product2b()
    }
}




