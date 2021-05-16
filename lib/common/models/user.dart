import 'dart:convert';

class User {
  final String password;
  final String email;
  final String token;
  final int age;
  final String name;
  final String image;
  User({this.password, this.email, this.token, this.age,this.image,this.name});
  

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
      'token': token,
      'age': age,
      'name': name,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      password: map['password'],
      email: map['email'],
      token: map['token'],
      age: map['age'],
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
