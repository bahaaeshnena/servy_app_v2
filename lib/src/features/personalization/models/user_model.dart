import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String? lastActivated;
  String? pushToken;
  bool? online;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  String description;
  String country;
  String skills;
  List<ServiceModel> favoriteServices; // القائمة لتخزين الخدمات
  double ratingUser;
  int numberOfRatings; // جديد: عدد التقييمات
  double totalRating; // جديد: إجمالي التقييمات

  UserModel({
    required this.lastActivated,
    required this.pushToken,
    required this.online,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.description,
    required this.country,
    required this.skills,
    this.favoriteServices = const [], // تعيين قائمة فارغة افتراضيًا
    this.ratingUser = 0.0,
    this.numberOfRatings = 0, // جديد
    this.totalRating = 0.0, // جديد
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
      description: '',
      country: '',
      skills: '',
      ratingUser: 0.0,
      numberOfRatings: 0,
      totalRating: 0.0,
      lastActivated: '',
      online: false,
      pushToken: '',
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
      'description': description,
      'Country': country,
      'Skills': skills,
      'FavoriteServices': favoriteServices
          .map((service) => service.toJson())
          .toList(), // تحويل قائمة الخدمات المفضلة إلى JSON
      'ratingUser': ratingUser,
      'numberOfRatings': numberOfRatings, // جديد
      'totalRating': totalRating, // جديد
      'lastActivated': lastActivated,
      'online': online,
      'pushToken': pushToken,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      List<ServiceModel> favoriteServices = [];
      if (data['FavoriteServices'] != null) {
        favoriteServices = List<ServiceModel>.from(data['FavoriteServices']
            .map((serviceData) => ServiceModel.fromSnapshot(serviceData)));
      }
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        description: data['description'] ?? '',
        country: data['Country'] ?? '',
        skills: data['Skills'] ?? '',
        favoriteServices: favoriteServices, // تعيين قائمة الخدمات المفضلة
        ratingUser: (data['ratingUser'] ?? 0).toDouble(),
        numberOfRatings: data['numberOfRatings'] ?? 0, // جديد
        totalRating: (data['totalRating'] ?? 0).toDouble(),
        lastActivated: data['lastActivated'] ?? '',
        online: data['online'] ?? false,
        pushToken: data['pushToken'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<ServiceModel> favoriteServices = [];

    return UserModel(
      id: json['id'] ?? '',
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      username: json['Username'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      profilePicture: json['ProfilePicture'] ?? '',
      description: json['description'] ?? '',
      country: json['Country'] ?? '',
      skills: json['Skills'] ?? '',
      favoriteServices: favoriteServices, // تعيين قائمة الخدمات المفضلة
      ratingUser: (json['ratingUser'] ?? 0.0).toDouble(),
      numberOfRatings: json['numberOfRatings'] ?? 0, // جديد
      totalRating: (json['totalRating'] ?? 0.0).toDouble(),
      lastActivated: json['lastActivated'] ?? '',
      online: json['online'] ?? false,
      pushToken: json['pushToken'] ?? '',
    );
  }
}
