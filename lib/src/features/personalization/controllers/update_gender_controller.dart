import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/screens/profile/profile.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

class UpdateGenderController extends GetxController {
  static UpdateGenderController get instance => Get.find();

  final gender = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateGenderFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeGender();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeGender() async {
    gender.text = userController.user.value.gender;
  }

  Future<void> updateGender() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoading(
          'We are updating your information.', TImages.docrAnimation);

      //Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!updateGenderFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Update users gender in the Firebase Firestore
      Map<String, dynamic> genderPerson = {
        'Gender': gender.text.trim(),
      };
      await userRepository.updateSingleField(genderPerson);

      //Update the Rx user value
      userController.user.value.gender = gender.text.trim();

      //remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success MEssage

      TLoaders.successSnackBar(
          title: "Congratulations", message: 'Your Gender has been updated.');

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
