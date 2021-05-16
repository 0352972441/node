import 'dart:convert';

class User {
  final String email;
  final String token;
  final int age;
  final String name;
  final String image;
  User({this.email, this.token, this.age,this.image,this.name});
  

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'token': token,
      'age': age,
      'name': name,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map["user"]['email']??"",
      token: map['token'] ?? "",
      age: map["user"]['age'] ?? "",
      name: map["user"]['name'] ?? "",
      image: map["user"]['avata'] ?? "",
    );
  }

  factory User.fromMapJson(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      token: map['token'],
      age: map['age'] ?? "",
      name: map['name'],
      image: map['avata'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
