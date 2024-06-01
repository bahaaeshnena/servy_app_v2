import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/data/repositories/user/user_repositories.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/screens/profile/profile.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/network/loaders.dart';
import 'package:servy_app/src/utils/network/network_manager.dart';
import 'package:servy_app/src/utils/popups/full_screen_loader.dart';

class UpdateCountryController extends GetxController {
  static UpdateCountryController get instance => Get.find();

  final country = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateCountryFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeCountry();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeCountry() async {
    country.text = userController.user.value.country;
  }

  Future<void> updateCountry() async {
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
      if (!updateCountryFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Update users country in the Firebase Firestore
      Map<String, dynamic> countryPerson = {
        'Country': country.text.trim(),
      };
      await userRepository.updateSingleField(countryPerson);

      //Update the Rx user value
      userController.user.value.country = country.text.trim();

      //remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success MEssage

      TLoaders.successSnackBar(
          title: "congratulations".tr, message: 'countryUpdate'.tr);

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
