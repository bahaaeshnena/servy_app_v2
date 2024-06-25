import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:servy_app/navigation_menu.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';
import 'package:servy_app/src/features/authentication/screens/login/login.dart';
import 'package:servy_app/src/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:servy_app/src/features/authentication/screens/signup/verify_email.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:servy_app/src/utils/exceptions/format_exception.dart';
import 'package:servy_app/src/utils/exceptions/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //*variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //*Get Authentication User Date
  User? get authUser => _auth.currentUser;

  //*called from main.dart on app launchp

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  //!-----------------------Email & Password Sign-in------------------

  //!-- REGISTER

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
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

  //!--[Email Veirify]---
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
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

//!Delete Account Warning
  void closeAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "logoutAccount".tr,
      middleText: 'messageLogout'.tr,
      confirm: ElevatedButton(
        onPressed: () async => logout(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.lg,
          ),
          child: Text('close'.tr),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text("cancel".tr),
      ),
    );
  }
  //!---[LogOutUser]---

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
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

  //!--[LogIn]---
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
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

  //!--[GoogleAuthentication]--
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //Trigger the athentication flow

      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtain the auth detailes from he request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //Create a new credintial
      // ignore: unused_local_variable
      final credintials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //once signed in, return the Usercredintial
      return await _auth.signInWithCredential(credintials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong $e');
      return null;
    }
  }

  //! Forget Password

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
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
  //! deletw User-Remove user Auth and FireStore Account

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
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
  //! Re Auth User

  Future<void> reAuthenticateEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExecption(e.code).message;
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
