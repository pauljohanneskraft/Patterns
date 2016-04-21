//
//  Composite.swift
//  Patterns
//
//  Created by Paul Kraft on 21.04.16.
//  Copyright © 2016 pauljohanneskraft. All rights reserved.
//

import Cocoa

class Component {}

class Composite : Component {
    private var children : [Component] = []
}

class Leaf : Component {}