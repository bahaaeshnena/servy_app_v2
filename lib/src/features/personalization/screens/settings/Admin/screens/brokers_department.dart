import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/screens/adding_brokers.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/screens/managment_of_brokers.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class BrokersDepartment extends StatelessWidget {
  const BrokersDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('brokersDepartment'.tr),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              LottieBuilder.asset(
                TImages.brokersDepartment,
                height: 350,
                width: 350,
              ),
              TSettingsMenuTile(
                icon: Icons.person_add_alt,
                title: 'addingBrokers'.tr,
                subTitle: "addingBrokersTitle".tr,
                onTap: () => Get.to(() => const AddingBrokers()),
              ),
              TSettingsMenuTile(
                icon: Icons.manage_accounts_outlined,
                title: 'managementOfBrokers'.tr,
                subTitle: "managementOfBrokersTitle".tr,
                onTap: () => Get.to(() => const ManagmentOfBrokers()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
