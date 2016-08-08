//
//  ConcurrentTests.swift
//  ConcurrentTests
//
//  Created by Paul Kraft on 08.08.16.
//  Copyright © 2016 pauljohanneskraft. All rights reserved.
//

import XCTest
import Patterns

class ConcurrentTests: XCTestCase {

    func testBarrier() {
        let c = 10
        var barrier = Barrier(count: c)
        let group = DispatchGroup()
        barrier = Barrier(count: c)
        var j = 0
        for i in 0..<c {
            DispatchQueue(label: "Thread \(i) by Patterns").async {
                group.enter()
                print("Thread \(i) starts waiting.")
                barrier.wait()
                print("Thread \(i) stops waiting.")
                j += 1
                group.leave()
            }
        }
        _ = group.wait(timeout: DispatchTime(uptimeNanoseconds: 1 << 45))
        XCTAssert(j == c)
    }
    
}
