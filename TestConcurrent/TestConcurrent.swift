//
//  TestConcurrent.swift
//  TestConcurrent
//
//  Created by Paul Kraft on 01.06.16.
//  Copyright © 2016 pauljohanneskraft. All rights reserved.
//

import XCTest

@testable import Patterns

class TestConcurrent: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBarrier() {
        let c = 10
        var barrier = Barrier(count: c)
        let group = dispatch_group_create()!
        measure {
            barrier = Barrier(count: c)
            for i in 0..<c {
                dispatch_group_async(group, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
                    print("Thread \(i) starts waiting.")
                    barrier.wait()
                    print("Thread \(i) stops waiting.")
                }
            }
            dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        }
    }
    
}

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
