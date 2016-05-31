
import Foundation

// not tested yet!

private struct Barrier {
    let count : Int
    var current = 0
    
    mutating func wait() {
        if count == 1 { return }
        current += 1
        var time : UInt32 = 1
        while current < count {
            time = (time >= 20 ? 20 : time + 1)
            sleep(time)
        }
    }
    
}


