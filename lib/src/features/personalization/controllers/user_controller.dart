// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servy_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';
import 'package:servy_app/src/features/authentication/screens/login/login.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

import '../../../utils/network/loaders.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final isAdmin = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final UserModel userModel = UserModel.empty();
  final RxList<UserModel> service = RxList<UserModel>([]);
  var users = <UserModel>[].obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
    subscribeToUserDocument();
    updatePushToken();
  }

//!---------------------Get token----------------------------

  Future<void> updatePushToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        print('Push Token: $token'); // Debugging line
        await userRepository.updateSingleField({'pushToken': token});
        user.value.pushToken = token;
        user.refresh();
      } else {
        // print('Failed to get push token'); // Debugging line
      }
    } catch (e) {
      // print('Error updating push token: $e'); // Debugging line
      TLoaders.errorSnackBar(
          title: 'Error', message: 'Failed to update push token: $e');
    }
  }

//!---------------------delete  Users  information----------------------------

  Future<void> deleteUser(String userId) async {
    try {
      await userRepository.deleteUser(userId);
      users.removeWhere((user) => user.id == userId);
      TLoaders.successSnackBar(
          title: 'success'.tr, message: 'successDeleteUser'.tr);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'error'.tr, message: 'errorDeleteUser $e'.tr);
    }
  }

//!-----------------------delete  Users with admin information---------------------
  Future<void> deleteUserWithAdmin(String userId) async {
    try {
      await userRepository.deleteUserWithAdmin(userId);
      users.removeWhere((user) => user.id == userId);
      TLoaders.successSnackBar(
          title: 'success'.tr, message: 'successDeleteUser'.tr);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'error'.tr, message: 'errorDeleteUser $e'.tr);
    }
  }

//!---------------------get Users information----------------------------

  Future<dynamic> getFieldValue(String ownerId, String field) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _db.collection('Users').doc(ownerId).get();

      if (snapshot.exists) {
        dynamic value = snapshot.get(field);
        return value;
      } else {
        // إذا لم يكن المستند موجودًا، يمكنك التعامل مع الحالة هنا
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  //!----------------------get feild user-------------------

  //*Fetch user Record

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      updateIsAdminValue(user.id); // تحديث قيمة isAdmin
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> updateIsAdminValue(String userId) async {
    try {
      final isAdminValue = await getFieldValue(userId, 'isAdmin');
      if (isAdminValue != null) {
        isAdmin.value = isAdminValue; // تحديث قيمة isAdmin
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: e.toString());
    }
  }

  void subscribeToUserDocument() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final userDoc =
          FirebaseFirestore.instance.collection('Users').doc(userId);
      userDoc.snapshots().listen((snapshot) {
        if (snapshot.exists) {
          final user = UserModel.fromSnapshot(snapshot);
          // تحديث حالة المستخدم عند تغيير الوثيقة
          this.user(user);
          isAdmin.value = user.isAdmin.value;
        }
      });
    }
  }

  //*Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First Update RX User and then check if user data is already stored. IF not store new data
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //convert Name to First and Last Name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          //* Map Data
          final user = UserModel(
            isAdmin: false,
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
            username: username,
            email: userCredential.user!.email ?? ' ',
            phoneNumber: userCredential.user!.phoneNumber ?? " ",
            profilePicture: userCredential.user!.photoURL ?? " ",
            description: userCredential.user!.phoneNumber ?? " ",
            country: userCredential.user!.phoneNumber ?? " ",
            skills: userCredential.user!.phoneNumber ?? " ",
            lastActivated: DateTime.now().microsecondsSinceEpoch.toString(),
            online: false,
            pushToken: userCredential.user!.phoneNumber ?? " ",
          );

          //* Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'dataNotSaved'.tr,
        message: 'dataNotSavedMessage'.tr,
      );
    }
  }

//!Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "titleOption4".tr,
      middleText: 'messageDeleteAccount'.tr,
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.lg,
          ),
          child: Text('delete'.tr),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text("cancel".tr),
      ),
    );
  }

//!Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoading('Processing', TImages.docrAnimation);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'ohSnap'.tr, message: e.toString());
    }
  }

//!--Re-Auth before deleting

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoading('Processing', TImages.docrAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'ohSnap'.tr, message: e.toString());
    }
  }

  //!Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 1080,
        maxWidth: 1920,
      );
      if (image != null) {
        imageUploading.value = true;
        //Upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        //Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: "congratulations".tr, message: 'congratulationsMessage'.tr);
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'ohSnap'.tr, message: 'ohSnapMessage $e'.tr);
    } finally {
      imageUploading.value = false;
    }
  }
}
