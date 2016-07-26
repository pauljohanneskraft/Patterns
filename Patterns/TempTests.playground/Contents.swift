//: Playground - noun: a place where people can play

import Cocoa

private protocol Observer {
    associatedtype State
    var observedState : State { get set }
}

extension Observer {
    mutating func update < S : Subject where S.State == Self.State > (_ sub: S) {
        self.observedState = sub.state
        // do something about it
    }
}

private protocol Subject {
    associatedtype O : Observer
    associatedtype State = O.State
    var state : State { get set }
    var observer : [O] { get set }
}

extension Subject {
    mutating func subscribe(_ obs: O) {
        observer.append(obs)
    }
    
    mutating func notify() {
        for i in observer.indices {
            observer[i].update(self)
        }
    }
}
