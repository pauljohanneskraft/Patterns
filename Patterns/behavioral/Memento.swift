
private protocol MementoProtocol {
    associatedtype State
    var state : State { get }   // has to be let, not possible to define in protocol
    init(_ state: State)        // set initial value, stays the same forever
}

private protocol OriginatorProtocol {
    associatedtype State
    var state : State { get set }
}

// more specific code

private struct Memento<State> : MementoProtocol {
    let state : State
    init(_ state: State) {
        self.state = state
    }
}

private struct Originator<State> : OriginatorProtocol {
    var state : State
}

private func demo() {
    var b = Originator(state: 5)
    let c = Memento(b.state)
    b.state = c.state
}



