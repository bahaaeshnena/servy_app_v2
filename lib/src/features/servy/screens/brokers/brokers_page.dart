import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/controllers/brokers_controller.dart';
import 'package:servy_app/src/features/servy/screens/brokers/details_brokers_page.dart';
import 'package:servy_app/src/features/servy/screens/brokers/widgets/card_brokers.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class BrokersPage extends StatelessWidget {
  const BrokersPage({super.key});

  @override
  Widget build(BuildContext context) {
    BrokersController controller = Get.put(BrokersController());

    controller.fetchAllBrokers();
    return Scaffold(
      appBar: TAppBar(
        title: Text('brokers'.tr),
        showBackArrow: false,
      ),
      body: Obx(
        () {
          if (controller.broker.isEmpty) {
            return const Center(
              child: Column(
                children: [
                  Text('There are no current brokers in the application'),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'brokersTitle'.tr,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'forMoreDetails'.tr,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextButton(
                              onPressed: () =>
                                  Get.to(() => const DetailsBrokersPage()),
                              child: Text(
                                'clickHere'.tr,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    for (var broker in controller.broker)
                      CardBrokers(
                        image: broker.image,
                        name: broker.username,
                        age: broker.age,
                        country: broker.country,
                        function: broker.function,
                        describtions: broker.desc,
                        email: broker.email,
                        onPressedEmail: () async {
                          await FireData().createRoom(broker.email);
                        },
                        color: TColors.primaryColor,
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
