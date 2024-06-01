import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/screens/profile/profile.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

class UpdateController extends GetxController {
  static UpdateController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserNames() async {
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
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Update users first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Message

      TLoaders.successSnackBar(
          title: "congratulations".tr, message: 'nameUpdate');

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'ohSnap'.tr, message: e.toString());
    }
  }
}
