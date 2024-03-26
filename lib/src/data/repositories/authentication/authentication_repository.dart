import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:servy_app/navigation_menu.dart';
import 'package:servy_app/src/features/authentication/screens/login/login.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:servy_app/src/features/authentication/screens/signup/verify_email.dart';
import 'package:servy_app/src/utils/exceptions/firebase_auth_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  //called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(
          () => VerifyEmailScreen(
            email: _auth.currentUser?.email,
          ),
        );
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  /*-----------------------Email & Password Sign-in------------------*/
  //-- REGISTER

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }

  ///--[Email Veirify]---
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }

  //---[LogOutUser]---

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }

  //--[LogIn]---
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } catch (e) {
      throw 'Something went wrong, PLease try again';
    }
  }
}
