
private protocol Context {}

private protocol Expression {
    func interpret(_ context: Context)
}

private protocol NonTerminalExpression : Expression {
    var expressions : [Expression] { get }
    func interpret(_ context: Context)
}

private protocol TerminalExpression : Expression {
    func interpret(_ context: Context)
}

// see also: Composite Pattern
