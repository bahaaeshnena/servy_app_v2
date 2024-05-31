import 'package:cloud_firestore/cloud_firestore.dart';

class BrokerModel {
  final String? id;
  String image;
  String username;
  String age;
  String country;
  String function;
  String desc;
  String email;

  BrokerModel({
    required this.id,
    required this.image,
    required this.username,
    required this.age,
    required this.country,
    required this.function,
    required this.desc,
    required this.email,
  });

  static BrokerModel empty() {
    return BrokerModel(
      id: '',
      image: '',
      username: '',
      age: '',
      country: '',
      function: '',
      desc: '',
      email: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'username': username,
      'age': age,
      'country': country,
      'function': function,
      'desc': desc,
      'email': email,
    };
  }

  factory BrokerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrokerModel(
        id: document.id,
        image: data['image'] ?? '',
        username: data['username'] ?? '',
        age: data['age'] ?? '',
        country: data['country'] ?? '',
        function: data['function'] ?? '',
        desc: data['desc'] ?? '',
        email: data['email'] ?? '',
      );
    } else {
      return BrokerModel.empty();
    }
  }

  factory BrokerModel.fromJson(Map<String, dynamic> json) {
    return BrokerModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      username: json['username'] ?? '',
      age: json['age'] ?? '',
      country: json['country'] ?? '',
      function: json['function'] ?? '',
      desc: json['desc'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
