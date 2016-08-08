
public struct Barrier {
    let count : Int
    var current = 0
    let queue = DispatchQueue(label: "Barrier Queue")
    
    public init(count: Int) {
        self.count = count
    }
    
    public mutating func wait() {
        if count == 1 { return }
        queue.sync { self.current += 1 }
        var time : UInt32 = 1
        while self.current < self.count {
            time = (time >= 20 ? 20 : time + 1)
            sleep(time)
        }
    }
}
