
private struct Singleton {
    private(set) static var single = Singleton()
    private init() {}
}
