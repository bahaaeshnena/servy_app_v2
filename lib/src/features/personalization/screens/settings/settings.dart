import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:servy_app/src/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:servy_app/src/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:servy_app/src/common/widgets/texts/section_heading.dart';
import 'package:servy_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:servy_app/src/features/personalization/screens/profile/profile.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/admin_options_page.dart';
import 'package:servy_app/src/features/personalization/screens/settings/become_our_broker/become_our_broker.dart';
import 'package:servy_app/src/features/personalization/screens/settings/contact_support/contact_support_page.dart';
import 'package:servy_app/src/features/personalization/screens/settings/discounts_page/discounts_page.dart';
import 'package:servy_app/src/features/personalization/screens/settings/favourite/favourite.dart';
import 'package:servy_app/src/features/personalization/screens/settings/languages/languages_page.dart';
import 'package:servy_app/src/features/personalization/screens/settings/my_services/my_services_page.dart';
import 'package:servy_app/src/features/personalization/screens/settings/privacy_policy/privacy_policy.dart';
import 'package:servy_app/src/features/personalization/screens/settings/rating_and_comments/rating_and_comments_page.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/theme/theme_mode_change.dart';

import '../../controllers/user_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                      "account".tr,
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
                  //?----------------------------- Account Settings--------------------------
                  TSectionHeading(
                    title: "accountSettings".tr,
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.edit_2,
                    title: "titleOption1".tr,
                    subTitle: "subTitleOption1".tr,
                    onTap: () => Get.to(() => const MyServicesPage()),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.star_border_outlined,
                    title: "titleOption2".tr,
                    subTitle: "subTitleOption2".tr,
                    onTap: () => Get.to(() => const RatingAndCommentsPage()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.personalcard,
                    title: "titleOption3".tr,
                    subTitle: "subTitleOption3".tr,
                    color: const Color.fromARGB(255, 68, 197, 120),
                    onTap: () => Get.to(() => const BecomeourBrokerPage()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.profile_delete,
                    color: Colors.red,
                    title: "titleOption4".tr,
                    subTitle: "subTitleOption4".tr,
                    onTap: () => controller.deleteAccountWarningPopup(),
                  ),
                  //?-----------------------------App Page--------------------------

                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: "appPage".tr, showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.heart,
                    title: "titleOption5".tr,
                    subTitle: "subTitleOption5".tr,
                    onTap: () => Get.to(() => const FavouriteScreen()),
                  ),
                  TSettingsMenuTile(
                    // icon: Icons.pages_sharp,
                    icon: Iconsax.discount_shape,
                    title: "titleOption6".tr,
                    subTitle: "subTitleOption6".tr,
                    onTap: () => Get.to(() => const DiscountsScreen()),
                  ),
                  Obx(() {
                    if (controller.user.value.isAdmin.value) {
                      return TSettingsMenuTile(
                        // icon: Icons.pages_sharp,
                        icon: Iconsax.user_octagon,
                        color: TColors.accent,
                        title: "adminOptions".tr,
                        subTitle: "subTitleAdminOption6".tr,
                        onTap: () => Get.to(() => const AdminOptionsPage()),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  //?-------------------------App Settings------------------------------

                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                      title: "appSettings".tr, showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Icons.contact_support_outlined,
                    title: "titleOption7".tr,
                    subTitle: "subTitleOption7".tr,
                    onTap: () => Get.to(() => const ContactSupportPage()),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.verified_user_outlined,
                    title: "titleOption8".tr,
                    subTitle: "subTitleOption8".tr,
                    onTap: () => Get.to(() => const PrivacyPolicyPage()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.language_square,
                    title: "titleOption9".tr,
                    subTitle: "subTitleOption9".tr,
                    onTap: () => Get.to(() => const LanguagesPage()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.moon,
                    title: "titleOption10".tr,
                    subTitle: "subTitleOption10".tr,
                    onTap: () {},
                    trailing: Switch(
                      value: ThemeService().isSavedDarkMode(),
                      onChanged: (value) {
                        ThemeService().changeTheme();
                      },
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => AuthenticationRepository.instance
                            .closeAccountWarningPopup(),
                        child: Text("logout".tr)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
