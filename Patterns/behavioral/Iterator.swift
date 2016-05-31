
private protocol Iterator {
    associatedtype Element
    func next() -> Element
    func last() -> Element
    func hasNext() -> Element
}