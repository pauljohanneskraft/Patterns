
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

private protocol Document {
    func open()
}

private protocol DocumentApplication {
    associatedtype D : Document
    func canOpen(_ file: String) -> Bool
    func create(_ doc: String) -> D
    func aboutToOpen(_ doc: D)
}

extension DocumentApplication {
    func openDocument(_ f: String) {
        if canOpen(f) {
            let d = create(f)
            aboutToOpen(d)
            d.open()
        }
    }
}

private struct PDFDoc : Document { func open() { print("PDF has been opened") } }

private struct PDFClient : DocumentApplication {
    func canOpen(_ file: String) -> Bool { return true }
    func create(_ doc: String) -> PDFDoc { return PDFDoc() }
    func aboutToOpen(_ doc: PDFDoc) { print("about to open PDF") }
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
        do { try runTest() }
        catch let e { print(e) }
        tearDown()
    }
}
