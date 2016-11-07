
private protocol Subject {
    func op()
}

private protocol Proxy : Subject {
    var subject : Subject { get }
}

extension Proxy {
    func op() {
        subject.op()
    }
}

// example
// 1 - Cars

private protocol CarProtocol {
    func drive()
}

private protocol Car : CarProtocol {
    init(age: Int, car: CarProtocol)
    var car : CarProtocol { get }
    var age : Int { get }
}

extension Car {
    func drive() {
        if age >= 16 {
            car.drive()
        }
    }
}