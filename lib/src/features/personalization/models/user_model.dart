import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servy_app/src/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  String gender;
  String country;
  String skills;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.gender,
    required this.country,
    required this.skills,
  });
  //

  String get fullName => '$firstName $lastName';

  //

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() {
    return UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '',
      gender: '',
      country: '',
      skills: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Gender': gender,
      'Country': country,
      'Skills': skills,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final date = document.data()!;
      return UserModel(
        id: document.id,
        firstName: date['FirstName'] ?? '',
        lastName: date['LastName'] ?? '',
        username: date['Username'] ?? '',
        email: date['Email'] ?? '',
        phoneNumber: date['PhoneNumber'] ?? '',
        profilePicture: date['ProfilePicture'] ?? '',
        gender: date['Gender'] ?? '',
        country: date['Country'] ?? '',
        skills: date['Skills'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
