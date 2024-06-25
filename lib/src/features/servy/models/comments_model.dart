import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsModel {
  DateTime? date; // تعديل النوع إلى DateTime
  String userEvaluation; // صاحب التعليق
  String userID; // صاحب ال profile
  String comment;
  double ratingProfile;
  int numberOfRatings; // جديد: عدد التقييمات
  double totalRating; // جديد: إجمالي التقييمات

  CommentsModel({
    this.date,
    required this.userEvaluation,
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
      date: DateTime.now(), // تعديل النوع إلى DateTime
      userEvaluation: '',
      userID: '',
      comment: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userEvaluation': userEvaluation,
      'userID': userID,
      'date': date?.toIso8601String(), // تحويل التاريخ إلى نص ISO8601
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
        userEvaluation: data['userEvaluation'] ?? '',
        userID: data['userID'] ?? '',
        comment: data['comment'] ?? '',
        date: data['date'] != null
            ? DateTime.parse(data['date'])
            : null, // تحويل النص إلى DateTime
        ratingProfile: (data['ratingProfile'] ?? 0).toDouble(),
        numberOfRatings: data['numberOfRatings'] ?? 0, // جديد
        totalRating: (data['totalRating'] ?? 0).toDouble(), // جديد
      );
    } else {
      return CommentsModel.empty();
    }
  }
}
