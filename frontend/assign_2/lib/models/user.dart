class UserData {
  final String name;
  final int age;

  UserData(this.name, this.age);

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(json['name'], json['age']);
  }
}
