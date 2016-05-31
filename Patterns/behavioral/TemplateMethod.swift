
// abstract concept

private protocol Abstract {
    func op1()
    func op2()
}

extension Abstract {
    func op() {
        op1()
        op2()
    }
}

// example 1: Document Application

protocol Document {
    func open()
}

private protocol Application {
    func canOpenFile(_ f: String) -> Bool
    func createDocument(_ f: String) -> Document
    func aboutToOpenDocument(_ d: Document)
}

extension Application {
    func openDocument(_ f: String) {
        if (canOpenFile(f)) {
            let d = createDocument(f)
            aboutToOpenDocument(d)
            d.open()
        }
    }
}


// example 2: TestCase

private protocol TestCase {
    func setUp()
    func runTest() throws
    func tearDown()
}

extension TestCase {
    func run() {
        setUp()
        do {
            try runTest()
        } catch let e {
            print(e)
        }
        tearDown()
    }
}
