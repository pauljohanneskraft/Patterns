//
//  TestComposite.swift
//  Patterns
//
//  Created by Paul Kraft on 01.06.16.
//  Copyright © 2016 pauljohanneskraft. All rights reserved.
//

import XCTest

@testable import Patterns

class TestComposite: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test() {
        print("Test 1: Tree")
        testTree()
    }

    func testTree() {
        var set : Set<Int> = []
        for v in 0 ..< 100 {
            set.insert(v)
        }
        var tree = Tree()
        measure {
            tree = Tree()
            for v in set {
                assert((try? tree.insert(InternalNode(v))) != nil)
            }
        }
        print(tree.dot)
        print(tree.array)
    }
    
}

// Tree

private protocol TreeComponent {
    var array: [Any] { get }
    var dot: String { get }
    mutating func insert<T : Comparable>(_ component: InternalNode<T>) throws -> TreeComponent
    mutating func remove<T : Comparable>(_ component: InternalNode<T>) throws -> TreeComponent
}

private struct Tree {
    var root : TreeComponent? = nil
    mutating func insert<T : Comparable>(_ component: InternalNode<T>) throws {
        if root == nil {
            root = component
            return
        }
        root = try root!.insert(component)
    }
    mutating func remove<T : Comparable>(_ component: InternalNode<T>) throws {
        if root == nil { throw TreeError.NotInTree(component) }
        root = try root!.insert(component)
    }
    var array : [Any] {
        if root == nil { return [] }
        return root!.array
    }
    var dot : String {
        var res = ""
        if root != nil { res = root!.dot }
        return "digraph tree {\n\(res)}"
    }
}

private struct InternalNode<Element : Comparable> : TreeComponent {
    
    var left     :  TreeComponent
    var right    :  TreeComponent
    var data     :  Element
    
    var array: [Any] {
        return left.array + [data] + right.array
    }
    
    var dot: String {
        var res = ""
        if let l =  left as? InternalNode { res += "\t\(data) -> \(l.data);\n" }
        if let r = right as? InternalNode { res += "\t\(data) -> \(r.data);\n" }
        return "\(res)\(left.dot)\(right.dot)"
    }
    
    init(_ data: Element, left: TreeComponent = ExternalNode(), right: TreeComponent = ExternalNode()) {
        self.data  = data
        self.left  = left
        self.right = right
    }
    
    private func chooseBranch<T : Comparable>(_ data: T) throws -> Branch {
        if T.self == Element.self {
            let data = data as! Element
            if data == self.data {
                return .equals
            } else if data < self.data {
                return .left
            } else {
                return .right
            }
        } else {
            if String(T) < String(Element) {
                return .left
            } else {
                return .right
            }
        }
    }
    
    mutating func insert<T : Comparable>(_ component: InternalNode<T>) throws -> TreeComponent {
        let branch = try chooseBranch(component.data)
        if branch == .left {
            left  = try  left.insert(component)
        } else if branch == .right {
            right = try right.insert(component)
        } else {
            throw TreeError.InTree(component)
        }
        return self
    }
    
    mutating func remove<T : Comparable>(_ component: InternalNode<T>) throws -> TreeComponent {
        let branch = try chooseBranch(component.data)
        switch branch {
        case .equals:
            if right is ExternalNode { return left }
            else if left is ExternalNode { return right }
            else { right = try right.insert(left as! InternalNode) }
        case  .right:
            right = try right.remove(component)
        case   .left:
            left  = try  left.remove(component)
        }
        throw TreeError.NotInTree(component)
    }
    
    func find<T : Comparable>(_ component: InternalNode<T>) -> TreeComponent? {
        return nil
    }
}

private struct ExternalNode : TreeComponent {
    
    var array : [Any] { return [] }
    var dot: String { return "" }
    
    func insert<T : Comparable>(_ component: InternalNode<T>) throws -> TreeComponent {
        return component
    }
    
    func remove<T : Comparable>(_ component: InternalNode<T>) throws -> TreeComponent {
        throw TreeError.NotInTree(component)
    }
}

private enum Branch {
    case left, right, equals
}

private enum TreeError : ErrorProtocol {
    case IncompatibleType(TreeComponent)
    case NotInTree(TreeComponent)
    case InTree(TreeComponent)
}


