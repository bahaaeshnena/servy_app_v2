import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/like_button/custom_like_button.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/detail_service_page.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class ServiceAbstract extends StatelessWidget {
  const ServiceAbstract({
    super.key,
    required this.title,
    required this.desc,
    required this.price,
    this.showHeartIcon = true,
    this.priceFromDescount,
    required this.imageUrl,
    required this.isLoadingImage,
    required this.serviceId,
    required this.service,
  });

  final ServiceModel service;
  final String serviceId;
  final String title;
  final String desc;
  final String price;
  final String imageUrl;
  final String? priceFromDescount;
  final bool showHeartIcon;
  final bool isLoadingImage;

  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.put(ServiceController());

    return GestureDetector(
      onTap: () => Get.to(() => DetailServisePage(
            service: service,
          )),
      child: Expanded(
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple[400] ?? Colors.transparent,
                Colors.deepPurple[300] ?? Colors.transparent,
                Colors.deepPurple[200] ?? Colors.transparent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // لون الظل
                spreadRadius: 3, // نطاق الانتشار
                blurRadius: 5, // نسبة الضبابية
                offset: const Offset(0, 5), // مكان بداية الظل
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                // ignore: unused_local_variable
                final networkImage = controller.services.value.imageService;

                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const TShimmerEffect(
                        width: double.infinity,
                        height: 160,
                        radius: 0,
                      );
                    },
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Iconsax.star1,
                            color: Color.fromARGB(255, 255, 230, 0)),
                        Text(
                          '4.5',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!service.hasDiscount)
                          Flexible(
                            child: Text(
                              '$price \$',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: TColors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        if (service.hasDiscount)
                          Flexible(
                            child: Text(
                              '$price \$',
                              style: const TextStyle(
                                color: TColors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.lineThrough,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness: 3,
                                decorationColor: TColors.primaryColor,
                              ),
                            ),
                          ),
                        if (service.hasDiscount)
                          Row(
                            children: [
                              const Icon(
                                Iconsax.arrow_right_1,
                                color: TColors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                ' $priceFromDescount \$',
                                style: const TextStyle(
                                  color: TColors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        if (showHeartIcon)
                          CustomLikeButton(
                              service: service, controller: controller),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
