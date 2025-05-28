class User{
  String id;
  String name;
  int age;

  User(this.id, this.name, this.age);

  @override
  String toString() {
    return 'ID: $id, Name: $name, Age: $age';
  }
}