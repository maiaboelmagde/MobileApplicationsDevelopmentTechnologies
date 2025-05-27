class Person{
  String _name;
  int _age;

  Person(this._name, this._age);


  String get name => _name;

  set name(String name) {
    if (name.isEmpty) {
      throw ArgumentError("Name cannot be empty.");
    }
    _name = name;
  }


  int get age => _age;

  set age(int age) {
    if (age < 0) {
      throw ArgumentError("Age cannot be negative.");
    }
    _age = age;
  }

  @override
  String toString() => 'Person(name: $_name, age: $_age)';
}
