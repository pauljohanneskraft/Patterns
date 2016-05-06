//
//  Singleton.swift
//  Patterns
//
//  Created by Paul Kraft on 06.05.16.
//  Copyright © 2016 pauljohanneskraft. All rights reserved.
//

import Cocoa

class Singleton {
    private(set) var single = Singleton()
    private init() {}
}
