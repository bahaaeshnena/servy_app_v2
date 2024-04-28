import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String title;
  String descreption;
  String imageService;
  String priceFrom;
  String? corssPodingService;
  String? descrCorssPodingService;
  String? ownerId; // Add owner ID field

  PostModel({
    required this.title,
    required this.descreption,
    required this.imageService,
    required this.priceFrom,
    this.corssPodingService,
    this.descrCorssPodingService,
    this.ownerId,
  });

  static PostModel empty() {
    return PostModel(
      title: '',
      descreption: '',
      imageService: '',
      priceFrom: '',
      corssPodingService: '',
      descrCorssPodingService: '',
      ownerId: '', // Initialize ownerId
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'descreption': descreption,
      'imageService': imageService,
      'priceFrom': priceFrom,
      'corssPodingService': corssPodingService,
      'descrCorssPodingService': descrCorssPodingService,
      'ownerId': ownerId, // Add ownerId to JSON
    };
  }

  factory PostModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return PostModel(
        title: data['title'] ?? '',
        descreption: data['descreption'] ?? '',
        imageService: data['imageService'] ?? '',
        priceFrom: data['priceFrom'] ?? '',
        corssPodingService: data['corssPodingService'] ?? '',
        descrCorssPodingService: data['descrCorssPodingService'] ?? '',
        ownerId: data['ownerId'] ?? '', // Set ownerId from snapshot
      );
    } else {
      return PostModel.empty();
    }
  }
}
