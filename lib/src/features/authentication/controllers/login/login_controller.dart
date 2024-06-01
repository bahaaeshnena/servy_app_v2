import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:servy_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  //VARIABELS

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

/* 
? بتعملي error
 !  @override
  ! void onInit() {
  !   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  !  password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  !  super.onInit();
 !  }
*/

//** التعديل
  @override
  void onInit() {
    String? rememberMeEmail = localStorage.read('REMEMBER_ME_EMAIL');
    String? rememberMePassword = localStorage.read('REMEMBER_ME_PASSWORD');

    if (rememberMeEmail != null) {
      email.text = rememberMeEmail;
    }

    if (rememberMePassword != null) {
      password.text = rememberMePassword;
    }

    super.onInit();
  }

  ///--Email and PAssword SignIn
  Future<void> emailPasswordSignIn() async {
    try {
      ///Start Loading

      TFullScreenLoader.openLoading('Logging you in...', TImages.docrAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      //Check Internet
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Save Data if Remember ME is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user using Email & PAssword Auth
      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "ohSnap".tr, message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoading('Logging you in...', TImages.docrAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //google Auth

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'ohSnap'.tr, message: e.toString());
    }
  }
}
