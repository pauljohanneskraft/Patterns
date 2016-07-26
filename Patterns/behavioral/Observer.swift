
// abstraction of Object having some kind of state that can be read and written to
private protocol StateObject {
    associatedtype State
    var state : State { get set }
}

// Observer protocol having a state, as well as an update-function
private protocol Observer : StateObject {
    mutating func updateOccurred()
    // you can customize yourself what you want to do with the changed state
}

extension Observer {
    mutating func update < S : Subject where S.State == Self.State > (sub: S) {
        self.state = sub.state
        updateOccurred()
    }
}

// Subject protocol having a state, as well as some Observers in an Array
private protocol Subject : StateObject {
    associatedtype O : Observer
    var observers : [O] { get set }
}

// when the State-Types are the same, observers can subscribe to subject, as well as they can be notified
extension Subject where O.State == Self.State {
    mutating func subscribe(obs: O) {
        observers.append(obs)
    }
    
    mutating func notify() {
        for i in observers.indices {
            observers[i].update(sub: self)
        }
    }
}




// Example 1: Reading from the console and then writing the input

private enum ReadingState {
    case read(String)
    case initial
}

private struct Reader : Subject {
    ///
    /// notifies all observers as soon as the state is changed
    ///
    /// --> don't use when you have intermediate states used in a function
    /// alternative: switch to using notify() in the methods itself or change didSet to sth like
    ///
    /// var state : ReadingState = .initial { didSet { if state != .initial { notify() } }
    ///
    var state : ReadingState = .initial { didSet { notify() } }
    
    
    ///
    /// objects observing state of the Reader
    ///
    private(set) var observers: [ReadingObserver] = []
}

private struct ReadingObserver : Observer {
    private(set) var state: ReadingState = .initial
    
    mutating func updateOccurred() {
        print(state)
    }
}

public func testReader() {
    var reader = Reader()
    
    reader.subscribe(obs: ReadingObserver())
    
    var string = ""
    
    while string != "stop" {
        print("Please insert some input. To stop please enter \"stop\"")
        string = readLine(strippingNewline: true)!
        reader.state = .read(string)
    }
    
    print("done")
}










