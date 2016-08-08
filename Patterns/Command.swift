
private protocol _Command {
    func execute()
}

private protocol SwitchType {
    var history : [_Command] { get set }
}
extension SwitchType {
    mutating func storeAndExecute(_ cmd: _Command) {
        history.append(cmd)
        cmd.execute()
    }
}

private protocol Receiver {
    func op1()
    func op2()
}

private protocol Command : _Command {
    associatedtype Rec : Receiver
    var receiver : Rec { get }
    init(_ receiver: Rec)

}

extension Command {
    func execute() {
        receiver.op1()
    }
}

// examples:
// 1 - PressSwitch

private struct Light : Receiver {
    func op1() {
        print("light is turned on")
    }
    func op2() {
        print("light is turned off")
    }
}

private struct FlipUpCommand : Command {
    let receiver : Light
    init(_ receiver: Light) {
        self.receiver = receiver
    }
    func execute() {
        receiver.op1()
    }
}

private struct FlipDownCommand : Command {
    let receiver : Light
    init(_ receiver: Light) {
        self.receiver = receiver
    }
    func execute() {
        receiver.op2()
    }
}

private struct Switch: SwitchType {
    var history = [_Command]()
}

private func commandDemo1(_ args: [String]) {
    
    let lamp = Light()
    let switchUp = FlipUpCommand(lamp)
    let switchDown = FlipDownCommand(lamp)
    var mySwitch = Switch();
    
    for v in args {
             if v == "ON"  { mySwitch.storeAndExecute(switchUp  ) }
        else if v == "OFF" { mySwitch.storeAndExecute(switchDown) }
             else { return }
    }
}


func commandDemo() {
    print("Demo 1: Light")
    commandDemo1(["ON", "OFF", "ON", "OFF", "OFF", "ON", "ON", "OFF", "STOP"])
}








