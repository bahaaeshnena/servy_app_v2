import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. PLease try again';
    }
  }
}
