import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/personalization/screens/settings/settings.dart';
import 'package:servy_app/src/features/servy/screens/add_service.dart/add_service_page.dart';
import 'package:servy_app/src/features/servy/screens/brokers/brokers_page.dart';
import 'package:servy_app/src/features/servy/screens/chat/chat_page.dart';
import 'package:servy_app/src/features/servy/screens/home/home.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
                icon: const Icon(Iconsax.home), label: 'home'.tr),
            NavigationDestination(
                icon: const Icon(Iconsax.message), label: 'chat'.tr),
            NavigationDestination(
                icon: const Icon(Iconsax.add_circle), label: 'add'.tr),
            NavigationDestination(
                icon: const Icon(Iconsax.personalcard), label: 'brokers'.tr),
            NavigationDestination(
                icon: const Icon(Iconsax.user), label: 'profile'.tr),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ChatPage(),
    const AddServicePage(),
    const BrokersPage(),
    const SettingsScreen(),
  ];
}
