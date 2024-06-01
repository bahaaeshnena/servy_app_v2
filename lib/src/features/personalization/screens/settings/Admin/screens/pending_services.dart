import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_page_my_services.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class PendingServices extends StatelessWidget {
  const PendingServices({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'pendingServices'.tr,
        ),
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
              .where((service) => service.status == 'pending')
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
                          const SizedBox(height: 150),
                          Text(
                            'noServicesFound'.tr, // رسالة العرض
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
                                    flex: 5,
                                    backgroundColor: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                    foregroundColor: Colors.greenAccent,
                                    autoClose: false,
                                    label: 'accepted',
                                    onPressed: ((context) {
                                      controller
                                          .acceptServices(service.serviceID);
                                    }),
                                    icon: Icons.check,
                                  ),
                                  SlidableAction(
                                    flex: 4,
                                    backgroundColor: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                    foregroundColor: Colors.red,
                                    autoClose: false,
                                    label: 'reject',
                                    onPressed: (context) async {
                                      controller
                                          .deleteService(service.serviceID);
                                    },
                                    icon: Icons.close,
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
