import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_page_my_services.dart';
import 'package:servy_app/src/features/personalization/controllers/user_controller.dart';
import 'package:servy_app/src/features/personalization/screens/settings/my_services/update_Service_page.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class MyServicesPage extends StatelessWidget {
  const MyServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());
    UserController userController =
        Get.find<UserController>(); // Get the user controller

    return Scaffold(
      appBar: TAppBar(
        title: Text('titleOption1'.tr),
        showBackArrow: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Services').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          List<ServiceModel> allServices = snapshot.data!.docs
              .map((doc) => ServiceModel.fromSnapshot(doc))
              .toList();
          List<ServiceModel> currentUserPosts = allServices
              .where((service) =>
                  service.ownerId == userController.user.value.id &&
                  service.status == 'accepted')
              .toList();
          controller.updateGetServices(
              currentUserPosts); // Update the posts in the controller
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Obx(
                () {
                  if (controller.service.isEmpty) {
                    // إذا لم تكن هناك بيانات لعرضها
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            'titleMyServiceScreen'.tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 150),
                          Text(
                            'noServicesFound'.tr, // رسالة العرض
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'youHaveNotPostedServices'.tr, // رسالة العرض
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // إذا كانت هناك بيانات لعرضها
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(TSizes.defaultSpace),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'titleMyServiceScreen'.tr,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        for (var service in controller.service)
                          Slidable(
                            endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    backgroundColor: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                    foregroundColor: Colors.blueAccent,
                                    autoClose: false,
                                    label: 'edit'.tr,
                                    onPressed: ((context) {
                                      Get.to(() => UpdateServicePage(
                                          service: service,
                                          serviceID: service.serviceID));
                                    }),
                                    icon: Iconsax.edit,
                                  ),
                                  SlidableAction(
                                    backgroundColor: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
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
                                            controller.deleteService(
                                                service.serviceID);
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
                                              Navigator.of(Get.overlayContext!)
                                                  .pop(),
                                          child: Text("cancel".tr),
                                        ),
                                      );
                                    },
                                    icon: Iconsax.box_remove,
                                  ),
                                ]),
                            child: ServiceCardAbstractMyServicesPage(
                              showHeartIcon: false,
                              title: service.title,
                              desc: service.descreption,
                              priceFromDescount: service.priceFromDescount,
                              price: service.priceFrom,
                              imageUrl: service.imageService,
                              isLoadingImage: false,
                              serviceId: '',
                              service: service,
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
