import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:servy_app/src/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:servy_app/src/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:servy_app/src/common/widgets/texts/section_heading.dart';
import 'package:servy_app/src/features/personalization/screens/profile/profile.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //User Profile
                  TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///--body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Settings
                  const TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.heart,
                    title: 'My Favorites',
                    subTitle: "List of favorite items",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.edit_2,
                    title: 'My ads',
                    subTitle: "Edit or delete my ads",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.star_border_outlined,
                    title: 'Ratings and comments',
                    subTitle: "To see comments and ratings for your account",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.personalcard,
                    title: 'Become our broker',
                    subTitle: "Join us to become a certified broker",
                    color: const Color.fromARGB(255, 68, 197, 120),
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.profile_delete,
                    color: Colors.red,
                    title: 'Delete Account',
                    subTitle: "Delete the account permanently",
                    onTap: () {},
                  ),

                  ///App setting
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Icons.contact_support_outlined,
                    title: 'Contact Support',
                    subTitle:
                        "Contact technical support for technical problems and complaints system",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.verified_user_outlined,
                    title: 'Privacy Policy',
                    subTitle:
                        "We take the protection of your privacy and personal data seriously",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.language_square,
                    title: 'Languages',
                    subTitle: "Change the application language",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.moon,
                    title: 'Dark Theme',
                    subTitle: "Change the application theme",
                    onTap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("Logout")),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}