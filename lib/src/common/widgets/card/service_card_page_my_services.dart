import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:servy_app/src/common/widgets/like_button/custom_like_button.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/detail_service_page.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class ServiceCardAbstractMyServicesPage extends StatelessWidget {
  const ServiceCardAbstractMyServicesPage({
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: const Color(0x00fcf9f8),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: InkWell(
          onTap: () => Get.to(() => DetailServisePage(
                service: service,
              )),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200,
                    image: isLoadingImage
                        ? null // لا تظهر الصورة إذا كان isLoadingImage == true
                        : DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.fill,
                          ),
                  ),
                  child: isLoadingImage
                      ? const TShimmerEffect(
                          width: double.infinity,
                          height: 170,
                        )
                      : null,
                ),
                const SizedBox(height: 10.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: TColors.primaryColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 50),
                      const Icon(Iconsax.star1,
                          size: 25, color: Color.fromARGB(255, 255, 230, 0)),
                      const Text(
                        '4.5',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                ReadMoreText(
                  desc,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primaryColor),
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primaryColor),
                ),
                const SizedBox(height: 23.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!service.hasDiscount)
                      Flexible(
                        child: Text(
                          '$price \$',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    if (service.hasDiscount)
                      Flexible(
                        child: Text(
                          '$price \$',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2,
                            decorationColor: TColors.primaryColor,
                          ),
                        ),
                      ),
                    if (service.hasDiscount)
                      Row(
                        children: [
                          Text(
                            'discount',
                            style: TextStyle(
                              color: TColors.primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.032,
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontFamily: 'Poppins',
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
        ),
      ),
    );
  }
}
