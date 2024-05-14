import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/texts/section_heading.dart';
import 'package:servy_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/changes/chane_phone.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/changes/change_country.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/changes/change_description.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/changes/change_name.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/changes/change_skills.dart';

import 'package:servy_app/src/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("profile".tr),
      ),
      body: SingleChildScrollView(
        //profile picture
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;

                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: image,
                              width: 100,
                              height: 100,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: Text("changePicture".tr),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Profile Info

              TSectionHeading(
                  title: 'profileInformation'.tr, showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'name'.tr,
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              TProfileMenu(
                title: 'userName'.tr,
                value: controller.user.value.username,
                onPressed: () {},
                iconVisible: false,
              ),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Personal Info

              TSectionHeading(
                  title: 'personalInformation'.tr, showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'ID'.tr,
                value: controller.user.value.id,
                onPressed: () {
                  String copiedValue =
                      controller.user.value.id; // Define value here
                  Clipboard.setData(ClipboardData(text: copiedValue));
                  // Display confirmation message
                  Fluttertoast.showToast(
                    msg: 'copy'.tr,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey[800],
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
                iconVisible: true,
                icon: Iconsax.copy,
              ),

              TProfileMenu(
                title: 'email'.tr,
                value: controller.user.value.email,
                onPressed: () {
                  String copiedValue =
                      controller.user.value.email; // Define value here
                  Clipboard.setData(ClipboardData(text: copiedValue));
                  // Display confirmation message
                  Fluttertoast.showToast(
                    msg: 'copy'.tr,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey[800],
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
                iconVisible: true,
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                title: 'phoneNumber'.tr,
                value: controller.user.value.phoneNumber,
                onPressed: () => Get.to(() => const ChangePhoneNumber()),
              ),
              TProfileMenu(
                title: 'descriptionProfile'.tr,
                value: controller.user.value.description,
                onPressed: () => Get.to(() => const ChangeDesc()),
              ),
              TProfileMenu(
                title: 'country'.tr,
                value: controller.user.value.country,
                onPressed: () => Get.to(() => const ChangeCountry()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Skills Info

              TSectionHeading(
                  title: 'skillsInformation'.tr, showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'skill'.tr,
                value: controller.user.value.skills,
                onPressed: () => Get.to(() => const ChangeSkills()),
              ),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => AuthenticationRepository.instance
                      .closeAccountWarningPopup(),
                  child: Text(
                    'logout'.tr,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        //Details
      ),
    );
  }
}
