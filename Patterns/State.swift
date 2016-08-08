
/*
private protocol State {
    associatedtype Operand
    associatedtype Result
    func op(state: inout Self, operand: Operand) -> Result
}

private protocol Context {
    associatedtype S : State
    var state : S { get set }
}

extension Context {
    func op(_ operand: S.Operand) -> S.Result {
        return state.op(state: &state, operand: operand)
    }
}
 */

// examples:
// 1 - Strings

/*
private protocol _State {
    mutating func writeName(context : inout _Context, name: String)
}

private struct StateLowerCase : _State {
    func writeName(context : inout _Context, name: String) {
        print(name.lowercased())
        context.state = StateMultipleUpperCase()
    }
    
}

private struct StateMultipleUpperCase : _State {
    /** Counter local to this state */
    private var count = 0;
    
    mutating func writeName(context : inout _Context, name: String) {
        print(name.lowercased())
        context.state = StateMultipleUpperCase()
        count += 1
        if(count > 1) {
            context.state = StateLowerCase()
        }
    }
    
}
 */
// The context class has a state variable that it instantiates in an initial state, in this case StateLowerCase. In its method, it uses the corresponding methods of the state object.

/*
private struct _Context {
    var state : _State
    
    init() {
        state = StateLowerCase()
    }
    
    mutating func writeName(_ name: String) {
        state.writeName(context: &self, name: name)
    }
}
// The demonstration below shows the usage:

private func demo() {
    var context = _Context()
    
    context.writeName("Monday")
    context.writeName("Tuesday")
    context.writeName("Wednesday")
    context.writeName("Thursday")
    context.writeName("Friday")
    context.writeName("Saturday")
    context.writeName("Sunday")
}

*/







