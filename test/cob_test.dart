class C1 {
  C1();
}


class _Person{
  final String _name;
  final int _age;
  const _Person(this._name, this._age);
}

class _Honored extends _Person {
  final List<String> _honors;
  const _Honored(String _name, int _age, this._honors): super(_name, _age);
}


void main(){
  const p1 = _Person("hello", 10);
  const p2 = _Person("hello", 10);
  final p3 = _Person("hello", 10);
  const p4 = _Person("Hello", 10);

  print("_Person");
  print(p1 == p2);
  print(p1 == p3);
  print(p2 == p3);
  print(p1 == p4);


  const h1 = _Honored("Manto", 12, ["guru", "montir"]);
  const h2 = _Honored("Manto", 12, ["guru", "montir"]);
  final h3 = _Honored("Manto", 12, ["guru", "montir"]);
  const h4 = _Honored("Manto", 12, ["guru", "penjahit"]);

  print("_Honored");
  print(h1 == h2);
  print(h1 == h3);
  print(h2 == h3);
  print(h1 == h4);
}