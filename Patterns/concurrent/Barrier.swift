
import Foundation

// not tested yet!

public struct Barrier {
    let count : Int
    var current = 0
    
    init(count: Int) {
        self.count = count
    }
    
    mutating func wait() {
        if count == 1 { return }
        self.current += 1
        var time : UInt32 = 1
        while self.current < self.count {
            time = (time >= 20 ? 20 : time + 1)
            print("Thread is going to sleep for \(time) s.")
            sleep(time)
        }
    }
}
