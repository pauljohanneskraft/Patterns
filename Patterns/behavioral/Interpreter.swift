
private protocol Context {}

private protocol Expression {
    func interpret(context: Context)
}

private protocol NonTerminalExpression : Expression {
    var expressions : [Expression] { get }
    func interpret(context: Context)
}

private protocol TerminalExpression : Expression {
    func interpret(context: Context)
}

// see also: Composite Pattern
