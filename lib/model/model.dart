// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usermodel {
  String? email;
  String? age;
  String? image;
  String? address;
  String? uid;
  String? password;
  String? username;
  String? phone;
  Usermodel({
    this.email,
    this.age,
    this.image,
    this.address,
    this.uid,
    this.password,
    this.username,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'age':age,
      'image':image,
      'address':address,
      'uid': uid,
      'password': password,
      'username': username,
      'phone': phone,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      email: map['email'] != null ? map['email'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) =>
      Usermodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
