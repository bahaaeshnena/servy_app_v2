import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/screens/profile/profile.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

class UpdateSkillsController extends GetxController {
  static UpdateSkillsController get instance => Get.find();

  final skills = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateSkillsFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeSkills();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeSkills() async {
    skills.text = userController.user.value.skills;
  }

  Future<void> updateSkills() async {
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
      if (!updateSkillsFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Update users skills in the Firebase Firestore
      Map<String, dynamic> genderPerson = {
        'Skills': skills.text.trim(),
      };
      await userRepository.updateSingleField(genderPerson);

      //Update the Rx user value
      userController.user.value.skills = skills.text.trim();

      //remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success MEssage

      TLoaders.successSnackBar(
          title: "congratulations".tr, message: 'skillsUpdate'.tr);

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
