
private protocol _StateProtocol {
    func op() -> _StateProtocol
}

private protocol Context {
    var state : _StateProtocol { get set }
}

private protocol State : _StateProtocol {
    static var single : Self { get }
    init()
}

private struct State1 : State {
    private(set) static var single = State1()
    private init() {}
    func op() -> _StateProtocol {
        print("state 1")
        return State2.single
    }
}

private struct State2 : State {
    private(set) static var single = State2()
    private init() {}
    func op() -> _StateProtocol {
        print("state 2")
        return State1.single
    }
}

private struct State3 : State {
    private(set) static var single = State3()
    private init() {}
    func op() -> _StateProtocol {
        print("state 3 - error")
        return self
    }
}

// examples:

