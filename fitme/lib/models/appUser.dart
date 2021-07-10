import 'package:flutter/foundation.dart';

class AppUser {
  String uid;
  String name;
  String email;
  int age;
  double height;
  double weight;
  double targetWeight;
  String gender;

  AppUser({
    @required this.uid,
    @required this.name,
    @required this.email,
    this.age,
    this.height,
    this.weight,
    this.targetWeight,
    this.gender,
  });

  AppUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    targetWeight = json['targetWeight'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['targetWeight'] = this.targetWeight;
    data['gender'] = this.gender;
    return data;
  }
}
