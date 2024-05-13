import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 0.6,
          ),
          itemCount: controller.favoriteServices.length,
          itemBuilder: (context, index) {
            var service = controller.favoriteServices[index];
            return ServiceAbstract(
              title: service.title,
              desc: service.descreption,
              price: service.priceFrom,
              priceFromDescount: service.priceFromDescount,
              imageUrl: service.imageService,
              isLoadingImage: false,
              serviceId: '',
              service: service, // عرض الصورة المحملة
            );
          },
        ),
      ),
    );
  }
}
