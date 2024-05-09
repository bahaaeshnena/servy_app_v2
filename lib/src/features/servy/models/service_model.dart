import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
  RxBool isLikedState = RxBool(false);

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
    };
  }

  factory ServiceModel.fromSnapshot(QueryDocumentSnapshot<Object?> document) {
    if (document.data() != null) {
      final data =
          document.data()! as Map<String, dynamic>; // Cast to correct type
      return ServiceModel(
        serviceID: data['serviceID'] ?? '',
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
      );
    } else {
      return ServiceModel.empty();
    }
  }
}
