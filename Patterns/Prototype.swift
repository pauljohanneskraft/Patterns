
private protocol Prototype {
    func clone() -> Self
}

private struct Prototype1 : Prototype {
    func clone() -> Prototype1 {
        let s = self
        // change s ?
        return s
    }
}

private struct Prototype2 : Prototype {
    func clone() -> Prototype2 {
        let s = self
        // change s ?
        return s
    }
}
