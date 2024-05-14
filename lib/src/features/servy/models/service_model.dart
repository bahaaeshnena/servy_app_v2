import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';

class ServiceModel {
  UserModel user;
  //!
  String? username;
  String? userImage;
  String serviceID;
  String title;
  String descreption;
  String imageService;
  String priceFrom;
  String? corssPodingService;
  String? descrCorssPodingService;
  String? priceFromDescount;
  String? ownerId; //user id
  String status;
  String categoris;
  bool hasDiscount;
  bool hasCorresService;
  bool isLikedState = false;
  String? countryUser;
  String? skillsUser;
  String? descUser;
  double ratingService;
  int numberOfRatings; // جديد: عدد التقييمات
  double totalRating; // جديد: إجمالي التقييمات

  ServiceModel({
    required this.user,
    //!
    this.username,
    this.userImage,
    this.skillsUser,
    this.countryUser,
    this.descUser,
    required this.serviceID,
    required this.title,
    required this.descreption,
    required this.imageService,
    required this.priceFrom,
    this.corssPodingService,
    this.descrCorssPodingService,
    this.ownerId,
    this.priceFromDescount,
    required this.status,
    required this.categoris,
    this.hasDiscount = false,
    this.hasCorresService = false,
    this.ratingService = 0.0,
    this.numberOfRatings = 0, // جديد
    this.totalRating = 0.0, // جديد
  });

  static ServiceModel empty() {
    return ServiceModel(
      serviceID: '',
      title: '',
      descreption: '',
      imageService: '',
      priceFrom: '',
      corssPodingService: '',
      descrCorssPodingService: '',
      ownerId: '',
      priceFromDescount: '',
      status: 'pending',
      categoris: '',
      username: '',
      userImage: '',
      countryUser: '',
      skillsUser: '',
      descUser: '',
      ratingService: 0.0,
      numberOfRatings: 0, // جديد
      totalRating: 0.0, // جديد
      //!
      user: UserModel.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceID': serviceID, // إضافة المعرف إلى JSON
      'title': title,
      'descreption': descreption,
      'imageService': imageService,
      'priceFrom': priceFrom,
      'corssPodingService': corssPodingService,
      'descrCorssPodingService': descrCorssPodingService,
      'ownerId': ownerId,
      'priceFromDescount': priceFromDescount,
      'status': status,
      'categoris': categoris,
      'isLikedState': isLikedState,
      'hasDiscount': hasDiscount,
      'hasCorresService': hasCorresService,
      'username': username,
      'userImage': userImage,
      'countryUser': countryUser,
      'skillsUser': skillsUser,
      'descUser': descUser,
      'ratingService': ratingService,
      'numberOfRatings': numberOfRatings, // جديد
      'totalRating': totalRating, // جديد
      //!
      'user': user.toJson(),
    };
  }

  factory ServiceModel.fromSnapshot(QueryDocumentSnapshot document) {
    if (document.data() != null) {
      final data =
          document.data()! as Map<String, dynamic>; // Cast to correct type
      return ServiceModel(
        serviceID: document.id,
        username: data['username'] ?? '',
        skillsUser: data['skillsUser'] ?? '',
        countryUser: data['countryUser'] ?? '',
        userImage: data['userImage'] ?? '',
        descUser: data['descUser'] ?? '',
        title: data['title'] ?? '',
        descreption: data['descreption'] ?? '',
        imageService: data['imageService'] ?? '',
        priceFrom: data['priceFrom'] ?? '',
        corssPodingService: data['corssPodingService'] ?? '',
        descrCorssPodingService: data['descrCorssPodingService'] ?? '',
        ownerId: data['ownerId'] ?? '',
        priceFromDescount: data['priceFromDescount'] ?? '',
        status: data['status'] ?? '',
        categoris: data['categoris'] ?? '',
        hasDiscount: data['hasDiscount'] ?? false,
        hasCorresService: data['hasCorresService'] ?? false,
        ratingService: (data['ratingService'] ?? 0).toDouble(),
        numberOfRatings: data['numberOfRatings'] ?? 0, // جديد
        totalRating: (data['totalRating'] ?? 0).toDouble(), // جديد
        user: UserModel.fromJson(data['user']),
      );
    } else {
      return ServiceModel.empty();
    }
  }
}
