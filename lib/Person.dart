class Person{
  String _gender;
  double _height,_weight;
  int _age = 0;
  set gender(String value) {
    _gender = value;
  }

  set height(double value) {
    _height = value;
  }

  set age(value) {
    _age = value;
  }

  set weight(value) {
    _weight = value;
  }

  String get gender => _gender;

  int get age => _age;

  double get weight => _weight;

  double get height => _height;

  bool statusComplete(){
    return gender != null && height != null && height > 0 && weight != null && weight > 0 && age > 0;
  }
}