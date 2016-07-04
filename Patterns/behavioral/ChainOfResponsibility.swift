
private protocol Request {}

private protocol Role {
    var successor: Any? { get }
    func isAllowed(_ request: Request) -> Bool
    func manage(_ request: Request)
}

extension Role {
    func process(_ request: Request) {
        if let s = successor as? Role? {
            if isAllowed(request) {
                manage(request)
            } else if s == nil {
                print("\(self) is not authorized but manages because there is no successor.")
                manage(request)
            } else {
                print("\(self) delegates to \(s!)")
                s!.process(request)
            }
        } else {
            print("successor is not an employee.")
            manage(request)
        }
    }
}

// examples:
// 1 - company

private struct PurchaseRequest : Request {
    let amount : Double
}

private protocol PurchasePower : Role {
    var allowedAmount: Double { get }
}

extension PurchasePower {
    static var base : Double { return 500.0 }
    func isAllowed(_ request: Request) -> Bool {
        if let purchase = request as? PurchaseRequest {
            if purchase.amount > allowedAmount { return false }
        } else {
            return false
        }
        return true
    }
    func manage(_ request: Request) {
        if let req = request as? PurchaseRequest {
            print("\(self) manages $\(req.amount)")
        }
        else {
            print("\(self) manages unknown request.")
        }
    }
}

// Four implementations of the abstract class above: Manager, Director, Vice President, President

private struct Manager : PurchasePower, CustomStringConvertible {
    var successor: Any?
    let allowedAmount = base * 10   // 5_000
    var description: String = "Manager"
}

private struct Director : PurchasePower, CustomStringConvertible {
    var successor: Any?
    let allowedAmount = base * 20   // 10_000
    var description: String = "Director"
}

private struct VicePresident : PurchasePower, CustomStringConvertible {
    var successor: Any?
    let allowedAmount = base * 40   // 20_000
    var description: String = "Vice President"
}

private struct President : PurchasePower, CustomStringConvertible {
    var successor: Any?
    let allowedAmount = base * 60   // 30_000
    var description: String = "President"
}

// The following code defines the PurchaseRequest class that keeps the request data in this example.

// In the following usage example, the successors are set as follows: Manager -> Director -> Vice President -> President

private func chainOfResponsibilityDemo1() {
    let president = President()
    var vicepresident = VicePresident()
    var director = Director()
    var manager = Manager()
    vicepresident.successor = president
    director.successor = vicepresident
    manager.successor = director
    for i in 0..<8 {
        let req = PurchaseRequest(amount: 501.0 + 500.0 * Double(i) * 10)
        print("$\(req.amount) are requested")
        manager.process(req)
    }
}

// source: Wikipedia

func chainOfResponsibilityDemo() {
    print("Demo 1: Manager")
    chainOfResponsibilityDemo1()
}


