import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'favourite'.tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // عرض الخدمات المفضلة
              Obx(() => Column(
                    children: controller.favoriteServices.map((service) {
                      return ServiceCardAbstract(
                        title: service.title,
                        desc: service.descreption,
                        price: service.priceFrom,
                        imageUrl: service.imageService,
                        isLoadingImage: false,
                        serviceId: service.serviceID,
                        service: service,
                        isLiked: service.isLikedState.value,
                      );
                    }).toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
