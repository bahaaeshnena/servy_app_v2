import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeature;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeature,
    this.parentId = '',
  });

  //? Empty Helper Function

  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeature: false);

  //? Convert model to json structure so that you can store data in Firebase

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeature': isFeature,
    };
  }

  //? Map Json orinted document snapshot from firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model

      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeature: data['IsFeatured'] ?? "",
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
