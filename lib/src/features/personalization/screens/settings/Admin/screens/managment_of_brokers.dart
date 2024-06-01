import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/controllers/brokers_controller.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/screens/update_brokers_page.dart';
import 'package:servy_app/src/features/servy/screens/brokers/widgets/card_brokers.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/network/loaders.dart';

class ManagmentOfBrokers extends StatelessWidget {
  const ManagmentOfBrokers({super.key});

  @override
  Widget build(BuildContext context) {
    BrokersController controller = Get.put(BrokersController());

    controller.fetchAllBrokers();

    return Scaffold(
      appBar: TAppBar(
        title: Text('managementOfBrokers'.tr),
        showBackArrow: true,
      ),
      body: Obx(
        () {
          if (controller.broker.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Text('managementOfBrokersError'.tr),
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
                    Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'managementOfBrokersSubTitle'.tr,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (var broker in controller.broker)
                      Slidable(
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              flex: 4,
                              backgroundColor:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              foregroundColor: Colors.blueAccent,
                              autoClose: false,
                              label: 'edit'.tr,
                              onPressed: ((context) {
                                Get.to(() => UpdateBroker(
                                      brokerID: broker.id!,
                                      broker: broker,
                                    ));
                              }),
                              icon: Iconsax.edit,
                            ),
                            SlidableAction(
                              flex: 5,
                              backgroundColor:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              foregroundColor: Colors.red,
                              autoClose: false,
                              label: 'delete'.tr,
                              onPressed: (context) {
                                Get.defaultDialog(
                                  contentPadding:
                                      const EdgeInsets.all(TSizes.md),
                                  title: "deleteService".tr,
                                  middleText: 'messageDeleteService'.tr,
                                  confirm: ElevatedButton(
                                    onPressed: () async {
                                      controller.deleteBrokers(broker.id!);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        side: const BorderSide(
                                            color: Colors.red)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: TSizes.lg,
                                      ),
                                      child: Text('delete'.tr),
                                    ),
                                  ),
                                  cancel: OutlinedButton(
                                    onPressed: () =>
                                        Navigator.of(Get.overlayContext!).pop(),
                                    child: Text("cancel".tr),
                                  ),
                                );
                              },
                              icon: Iconsax.box_remove,
                            ),
                          ],
                        ),
                        child: CardBrokers(
                          image: broker.image,
                          name: broker.username,
                          age: broker.age,
                          country: broker.country,
                          function: broker.function,
                          describtions: broker.desc,
                          email: broker.email,
                          onPressedEmail: () async {
                            await FireData().createRoom(broker.email);
                            TLoaders.successSnackBar(
                                title: 'done'.tr,
                                message: 'managementOfBrokersDoneChat'.tr);
                          },
                          color: TColors.primaryColor,
                        ),
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
