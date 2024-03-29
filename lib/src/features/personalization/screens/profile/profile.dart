import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/texts/section_heading.dart';
import 'package:servy_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/changes/change_name.dart';
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
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
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
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Profile Info

              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Personal Info

              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'User ID',
                icon: Iconsax.copy,
                value: controller.user.value.id,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'E-Mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: "Male",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Country',
                value: "Jordan",
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Skills Info

              const TSectionHeading(
                  title: 'Skills Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Skills 1',
                value: "Android Application",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Skills 2',
                value: "Flutter developer",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Skills 3',
                value: "Logo design",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Skills 4',
                value: "Video Editing ",
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => AuthenticationRepository.instance
                      .closeAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(
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
