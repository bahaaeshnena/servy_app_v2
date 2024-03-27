import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';
import 'package:servy_app/src/features/authentication/screens/signup/verify_email.dart';
import 'package:servy_app/src/features/personalization/models/user_model.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

//!variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //!---SIGNUP
  void signup() async {
    try {
      TFullScreenLoader.openLoading(
          "We are processing your information...", TImages.docrAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //!form validation

      if (!signupFormKey.currentState!.validate()) return;

      //!Privacy Policy Check

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              'In oeder to create, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      //!Rigester user in the firebase Authentication & Save User data in the firebase
      // ignore: non_constant_identifier_names
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //!Save Authentication user date in the firebase firestore

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      //remove Loader
      TFullScreenLoader.stopLoading();

      //!show success Message
      TLoaders.successSnackBar(
        title: "Congratulations",
        message: 'Your account has been created! Verify email to continue.',
      );

      //!move Success Email Verify Screen

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
