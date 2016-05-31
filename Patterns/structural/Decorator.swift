
private protocol _Component {
    func op()
}

private protocol Component : _Component {
    func op()
}
/*
private
public abstract class Spielfigur
{
    public abstract void Drohe();
}

public class Monster : Spielfigur
{
    public override void Drohe()
    {
    Console.WriteLine("Grrrrrrrrrr.");
    }
}

public abstract class Dekorierer : Spielfigur
{
    private Spielfigur meineFigur;
    
    public Dekorierer(Spielfigur s)
    {
    meineFigur = s;
    }
    
    public override void Drohe()
    {
    meineFigur.Drohe();
    }
}

public class HustenDekorierer : Dekorierer
{
    public HustenDekorierer(Spielfigur s)
    : base(s)
    { }
    
    public override void Drohe()
    {
    Console.Write("Hust, hust. ");
    base.Drohe();
    }
}

public class SchnupfenDekorierer : Dekorierer
{
    public SchnupfenDekorierer(Spielfigur s)
    : base(s)
    { }
    
    public override void Drohe()
    {
    Console.Write("Schniff. ");
    base.Drohe();
    }
}

public class ClientCode
{
    public static void Main()
    {
    Spielfigur meinMonster = new Monster();
    meinMonster.Drohe();
    
    Spielfigur meinVerhustetesMonster = new HustenDekorierer(meinMonster);
    meinVerhustetesMonster.Drohe();
    
    Spielfigur meinVerschnupftesMonster = new SchnupfenDekorierer(meinMonster);
    meinVerschnupftesMonster.Drohe();
    
    Spielfigur meinVerschnupftesVerhustetesMonster = new SchnupfenDekorierer(new HustenDekorierer(meinMonster));
    meinVerschnupftesVerhustetesMonster.Drohe();
    
    Spielfigur meinVerhustetesVerschnupftesMonster = new HustenDekorierer(new SchnupfenDekorierer(meinMonster));
    meinVerhustetesVerschnupftesMonster.Drohe();
    }
}*/








