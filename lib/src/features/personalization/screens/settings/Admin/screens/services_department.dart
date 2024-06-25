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
      appBar: TAppBar(
        title: Text('servicesDepartment'.tr),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              LottieBuilder.asset(
                TImages.servicesDepartment,
                height: 300,
                width: 300,
              ),
              TSettingsMenuTile(
                icon: Icons.pending_outlined,
                title: 'pendingServices'.tr,
                subTitle: "pendingServicesTitle".tr,
                onTap: () => Get.to(() => const PendingServices()),
              ),
              TSettingsMenuTile(
                icon: Icons.storage_rounded,
                title: 'allUserServices'.tr,
                subTitle: "allUserServicesTitle".tr,
                onTap: () => Get.to(() => const AllUserServices()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
