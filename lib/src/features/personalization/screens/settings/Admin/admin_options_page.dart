import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/screens/services_department.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/screens/users_department_page.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class AdminOptionsPage extends StatelessWidget {
  const AdminOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("adminOptions".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              LottieBuilder.asset(TImages.adminOptions),
              Text(
                'On this page you can manage, accept and reject user services and manage brokers and delete users applications',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              TSettingsMenuTile(
                icon: Icons.storage_rounded,
                title: 'Services Department',
                subTitle: "Application Services Management Department",
                onTap: () => Get.to(() => const ServicesDepartment()),
              ),
              TSettingsMenuTile(
                icon: Iconsax.personalcard,
                title: 'Brokers Department',
                subTitle: "Brokers Management Department",
                onTap: () => Get.to(() => const ServicesDepartment()),
              ),
              TSettingsMenuTile(
                icon: Iconsax.user_search,
                title: 'Users Department',
                subTitle: "Application users management section",
                onTap: () => Get.to(() => const UsersDepartment()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
