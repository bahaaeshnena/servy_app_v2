import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servy_app/src/data/repositories/authentication/authentication_repository.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

//?------------------delete  Users date from Firebase-------------
  Future<void> deleteUser(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      throw 'Error deleting user: $e';
    }
  }

//?------------------delete  Users with Admin date from Firebase-------------
  Future<void> deleteUserWithAdmin(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } catch (e) {
      throw 'Error deleting user: $e';
    }
  }

  //?------------------fetch All Users data from Firebase-------------
  Stream<List<UserModel>> getAllUsersStream() {
    return _db.collection('Users').snapshots().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => UserModel.fromSnapshot(doc))
          .toList();
    });
  }

//?------------------Finction to save user date to Firebase-------------
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }

  //?------------------Function to Fetch user details on user ID-------------
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }

  //?------------------Function to Update user date in Firestore-------------
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }

  //?------------------Update any field in specific Users Collection-------------
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
      // print('Field updated successfully'); // Debugging line
    } on FirebaseException catch (e) {
      // print('FirebaseException: ${e.message}'); // Debugging line
      throw TFirebaseAuthExecption(e.code).message;
    } on FormatException catch (_) {
      // print('FormatException'); // Debugging line
      throw const TFormatException();
    } on PlatformException catch (e) {
      // print('PlatformException: ${e.message}'); // Debugging line
      throw TPlatformException(e.code).message;
    } catch (e) {
      // print('Exception: $e'); // Debugging line
      throw 'Something went wrong, Please try again';
    }
  }

  //?------------------Function to remove user data from Firestore-------------
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }

  //? Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }
}
