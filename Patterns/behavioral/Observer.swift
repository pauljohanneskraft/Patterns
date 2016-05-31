
private protocol Subject {
    var observers : [Observer] { get }
}

private protocol ConcreteSubject : Subject {
    var state : State { get set }
}

private protocol Observer {
    func update()
}

private protocol State {}

private protocol ConcreteObserver : Observer {
    var observedState : State { get }
}

// example 1

private enum appState : State {
    case running, terminated
}















