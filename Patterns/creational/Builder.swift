
private protocol EmptyInitializer {
    init()
}

private protocol Product {
    associatedtype PropertyType : EmptyInitializer
    init()
    var property : PropertyType { get set }
}

private protocol BuilderProtocol {
    associatedtype P : Product
    var product : P { get set }
    init()
    mutating func set(property: P.PropertyType)
}

private struct Builder<P where P : Product> : BuilderProtocol {
    private(set) var product : P
    init() {
        product = P()
    }
    mutating func set(property: P.PropertyType) {
        product.property = property
    }
}

private protocol Director {
    associatedtype P : Product
    func construct() -> P
}

// examples:
// 1 - Cars

private struct Car {
    init() {}
    var wheels : Int = 0
    var color : String = ""
}

private protocol ICarBuilder {
    mutating func set(color: String)
    mutating func set(wheels: Int)
    func getResult() -> Car
}

private struct CarBuilder : ICarBuilder {
    var car : Car
    
    init() {
        car = Car()
    }
    mutating func set(color: String) {
        car.color = color
    }
    mutating func set(wheels: Int) {
        car.wheels = wheels
    }
    func getResult() -> Car {
        return car
    }
}

private protocol CarDirector {}
extension CarDirector {
    func construct() -> Car {
        var builder = CarBuilder()
        builder.set(color: "Red")
        builder.set(wheels: 4)
        return builder.getResult()
    }
}