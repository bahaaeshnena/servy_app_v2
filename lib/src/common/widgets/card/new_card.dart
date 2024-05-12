import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/like_button/custom_like_button.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.0,
        ),
        gradient: LinearGradient(colors: [
          Colors.blue[400] ?? Colors.transparent,
          Colors.blue[300] ?? Colors.transparent,
          Colors.blue[200] ?? Colors.transparent,
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.asset(
              imageUrl,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                        const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                if (service.hasDiscount)
                  Row(
                    children: [
                      Text(
                        'discount',
                        style: TextStyle(
                          color: TColors.primaryColor,
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Iconsax.discount_shape,
                        color: TColors.primaryColor,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Iconsax.arrow_right_1,
                        color: TColors.primaryColor,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        ' $priceFromDescount \$',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                if (showHeartIcon)
                  CustomLikeButton(service: service, controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
