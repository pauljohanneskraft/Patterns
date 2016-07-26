

private protocol FixedLengthArrayProtocol : ExpressibleByArrayLiteral {
    associatedtype Element
    var array : [Element?] { get set }
    var capacity : Int { get }
    init(count: Int)
}

struct FixedLengthArray<Element> : FixedLengthArrayProtocol {
    private(set) var array: [Element?]
    private(set) var count: Int = 0
    var capacity: Int { return array.count }
    init(arrayLiteral array: Element...) { // do not use, if not necessary
        self.array = [Element?](repeating: nil, count: array.count)
        for i in array.indices {
            self[i] = Optional(array[i])
        }
    }
    init(count: Int) {
        array = [Element?](repeating: nil, count: count)
        self.count = 0
    }
    subscript(index: Int) -> Element? {
        get {
            return array[index]
        }
        set {
            let o = array[index]
            if o == nil && newValue != nil { count += 1 }
            else if o != nil && newValue == nil { count -= 1 }
            array[index] = newValue
        }
    }
    var values : [Element] {
        var values = [Element]()
        for v in array {
            if v != nil {
                values.append(v!)
            }
        }
        return values
    }
}

func fixedLengthArray() {
    
}



