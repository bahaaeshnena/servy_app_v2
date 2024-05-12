import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String serviceID; // حقل المعرف الجديد
  String title;
  String descreption;
  String imageService;
  String priceFrom;
  String? corssPodingService;
  String? descrCorssPodingService;
  String? priceFromDescount;
  String? ownerId; // حقل المعرف للمستخدم
  String status; // حالة المشاركة
  String categoris;
  bool hasDiscount;
  bool hasCorresService;
  bool isLikedState = false;

  ServiceModel({
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
    };
  }

  factory ServiceModel.fromSnapshot(QueryDocumentSnapshot document) {
    if (document.data() != null) {
      final data =
          document.data()! as Map<String, dynamic>; // Cast to correct type
      return ServiceModel(
        serviceID: document.id,
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
      );
    } else {
      return ServiceModel.empty();
    }
  }
}
