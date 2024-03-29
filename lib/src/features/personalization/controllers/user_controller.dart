import 'package:firebase_auth/firebase_auth.dart';
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
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //*Fetch user Record

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
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
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
            username: username,
            email: userCredential.user!.email ?? ' ',
            phoneNumber: userCredential.user!.phoneNumber ?? " ",
            profilePicture: userCredential.user!.photoURL ?? " ",
          );

          //* Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Date not Saved',
        message:
            'Something went wrong while saving your information. You can re-save your date in your Profile.',
      );
    }
  }

//!Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText:
          'Are you sure want to delete your account permanently? this action is not reversible and all of your data willbe removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TSizes.lg,
          ),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
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
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
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
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //!Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
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
            title: "Congratulations",
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
