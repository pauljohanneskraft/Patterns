
private protocol _Component {
    func op()
}

private protocol Component : _Component {
    func op()
}

// examples:
// 1 - Game

private protocol Token {
    func threaten()
}

private struct Monster : Token {
    func threaten() {
        print("Grrrrrr.")
    }
}

private protocol Decorator : Token {
    var token : Token { get }
}

extension Decorator {
    func threaten() {
        token.threaten()
    }
}

private struct CoughingDecorator : Decorator {
    var token: Token
    
    init(token: Token) {
        self.token = token
    }
    
    func threaten() {
        print("cough, cough. ")
        token.threaten()
    }
}

private struct SniffingDecorator : Decorator {
    var token: Token
    
    init(token: Token) {
        self.token = token
    }
    
    func threaten() {
        print("sniff.")
        token.threaten()
    }
}

private func decoratorDemo1() {
    let monster = Monster()
    monster.threaten()
    
    let coughingMonster = CoughingDecorator(token: monster)
    coughingMonster.threaten()
    
    let sniffingMonster = SniffingDecorator(token: monster)
    sniffingMonster.threaten()
    
    let sniffingCoughingMonster = SniffingDecorator(token: CoughingDecorator(token: monster))
    sniffingCoughingMonster.threaten()
    
    let coughingSniffingMonster = CoughingDecorator(token: SniffingDecorator(token: monster))
    coughingSniffingMonster.threaten()
}

func decoratorDemo() {
    print("Demo 1: Monsters")
    decoratorDemo1()
}






