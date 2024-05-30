import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/screens/all_user_services.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/screens/pending_services.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class ServicesDepartment extends StatelessWidget {
  const ServicesDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Services Department'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // ContainerServicesDepartment(
              //   title: 'Pending services',
              //   onTap: () {},
              // ),
              LottieBuilder.asset(
                TImages.servicesDepartment,
                height: 300,
                width: 300,
              ),
              TSettingsMenuTile(
                icon: Icons.pending_outlined,
                title: 'Pending services',
                subTitle: "List of all services whose status is pending",
                onTap: () => Get.to(() => const PendingServices()),
              ),
              TSettingsMenuTile(
                icon: Icons.storage_rounded,
                title: 'All user services',
                subTitle: "List of all user services in the application",
                onTap: () => Get.to(() => const AllUserServices()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
