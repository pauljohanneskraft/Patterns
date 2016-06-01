
/*
//Colleague interface
private protocol Command {
    func execute()
}

//Abstract Mediator
private protocol Mediator {
    func book()
    func view()
    func search()
    mutating func register(view: BtnView)
    mutating func register(search: BtnSearch)
    mutating func register(book: BtnBook)
    mutating func register(display: LblDisplay)
}

//Concrete mediator
private struct ParticipantMediator : Mediator {
    var btnView : BtnView? = nil
    var btnSearch : BtnSearch? = nil
    var btnBook : BtnBook? = nil
    var show : LblDisplay? = nil
    
    mutating func register(view: BtnView) {
        btnView = view
    }
    
    mutating func register(search: BtnSearch) {
        btnSearch = search
    }
    
    mutating func register(book: BtnBook) {
        btnBook = book
    }
    
    mutating func register(display: LblDisplay) {
        show = display
    }
    
    func book() {}
    
    func view() {}
    
    func search() {}
}

//A concrete colleague
private struct BtnView : Command {
    var med : Mediator
    
    init(_ med: Mediator) {
        self.med = med
        self.med.register(view: self)
    }
    
    func execute() {
        med.view();
    }
}

//A concrete colleague
private struct BtnSearch : Command {
    var med : Mediator
    
    init(_ med: Mediator) {
        self.med = med
        self.med.register(search: self)
    }
    
    func execute() {
        med.search();
    }
}

//A concrete colleague
private struct BtnBook : Command {
    var med : Mediator
    
    init(_ med: Mediator) {
        self.med = med
        self.med.register(book: self)
    }
    
    func execute() {
        med.book();
    }
}

private struct LblDisplay {
    var med : Mediator
    
    init(_ med: Mediator) {
        self.med = med
        self.med.register(display: self)
    }
}

private func demo() {
    var med : Mediator = ParticipantMediator()
    
    let view = BtnView(med)
    let book = BtnBook(med)
    let search = BtnSearch(med)
    let show = LblDisplay(med)
    
    
    
    public void actionPerformed(ActionEvent ae) {
        Command comd = (Command) ae.getSource();
        comd.execute();
    }
    
    public static void main(String[] args) {
        new MediatorDemo();
    }
    
}
 */