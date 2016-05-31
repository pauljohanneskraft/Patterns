
private protocol Subject {
    var strategy : Strategy { get }
}

extension Subject {
    func op() {
        strategy.op()
    }
}

private protocol Strategy {
    func op()
}

// examples:

