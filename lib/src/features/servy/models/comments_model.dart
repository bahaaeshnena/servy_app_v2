import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';

class CommentsModel {
  String? date;
  UserModel user; //صاحب التعليق
  String userID; //صاحب ال profile
  String comment;
  double ratingProfile;
  int numberOfRatings; // جديد: عدد التقييمات
  double totalRating; // جديد: إجمالي التقييمات

  CommentsModel({
    this.date,
    required this.user,
    required this.userID,
    required this.comment,
    this.ratingProfile = 0.0,
    this.numberOfRatings = 0, // جديد
    this.totalRating = 0.0, // جديد
  });

  static CommentsModel empty() {
    return CommentsModel(
      ratingProfile: 0.0,
      numberOfRatings: 0, // جديد
      totalRating: 0.0, // جديد
      date: '',
      user: UserModel.empty(),
      userID: '',
      comment: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'userID': userID,
      'date': date,
      'comment': comment,
      'ratingProfile': ratingProfile,
      'numberOfRatings': numberOfRatings, // جديد
      'totalRating': totalRating, // جديد
    };
  }

  factory CommentsModel.fromSnapshot(QueryDocumentSnapshot document) {
    if (document.data() != null) {
      final data =
          document.data()! as Map<String, dynamic>; // Cast to correct type
      return CommentsModel(
        user: UserModel.fromJson(data['user']),
        userID: data['userID'] ?? '',
        comment: data['comment'] ?? '',
        date: data['date'] ?? '',
        ratingProfile: (data['ratingProfile'] ?? 0).toDouble(),
        numberOfRatings: data['numberOfRatings'] ?? 0, // جديد
        totalRating: (data['totalRating'] ?? 0).toDouble(), // جديد
      );
    } else {
      return CommentsModel.empty();
    }
  }
}
