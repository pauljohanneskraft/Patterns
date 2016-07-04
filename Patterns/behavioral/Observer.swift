
private protocol _Subject {
    var observers : [ObserverProtocol] { get set }
}

private protocol Subject : _Subject {
    var state : State { get set }
}
extension Subject {
    mutating func update() {
        for i in observers.indices {
            observers[i].update(self)
        }
    }
}


private protocol _ObserverProtocol {
    mutating func update(_ subject: Subject)
}

private protocol State {}

private protocol ObserverProtocol : _ObserverProtocol {
    var observedState : State { get set }
}

// example 1

import Cocoa

private enum ReadingState : State {
    case read(String)
}

let stdin = NSFileHandle.standardInput()

private struct EventSource : Subject {
    var observers = [ObserverProtocol]()
    var state : State = ReadingState.read("")
    mutating func run() {
        while true {
            let response = String(NSString(data: stdin.availableData, encoding: NSUTF8StringEncoding)!)
            state = ReadingState.read(response)
            update()
            if response.lowercased().hasPrefix("stop") {
                print("subject will stop.")
                return
            }
        }
    }
}

private struct Observer : ObserverProtocol {
    var observedState : State
    init(_ initialState: State) {
        self.observedState = initialState
    }
    mutating func update(_ subject: Subject) {
        observedState = subject.state
        print(subject.state)
    }
}

private func observerDemo1() {
    print("Enter text > ")
    var source = EventSource()
    let obs = Observer(ReadingState.read(""))
    source.observers.append(obs)
    source.run()
}

func observerDemo() {
    print("Demo 1: Input")
    observerDemo1()
}








