import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/product_detail.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class ServiceCardAbstract extends StatelessWidget {
  const ServiceCardAbstract({
    Key? key,
    required this.title,
    required this.desc,
    required this.price,
    this.showHeartIcon = true,
    this.priceFromDescount,
    required this.imageUrl,
    required this.isLoadingImage,
    required this.serviceId,
    required this.service,
    this.isLiked = false, // Define the named parameter isLiked
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
  final bool isLiked; // Declare the named parameter isLiked

  @override
  Widget build(BuildContext context) {
    final RxBool isLikedState =
        isLiked.obs; // Use a different name to avoid conflict
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
          onTap: () => Get.to(() => const ServyDtailsScreen()),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200,
                    image: isLoadingImage
                        ? null // لا تظهر الصورة إذا كان isLoadingImage == true
                        : DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
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
                          color: Colors.blue,
                          fontSize: 16,
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
                    Text(
                      '$price \$',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                    ),
                    const Text(
                      '\$',
                      style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                    ),
                    if (showHeartIcon)
                      Obx(
                        () => IconButton(
                            onPressed: () {
                              controller.toggleFavorite(service);
                              isLikedState.value = !isLikedState.value;
                            },
                            icon: Icon(
                              Iconsax.heart5,
                              color: isLikedState.value ? Colors.red : null,
                              size: 33,
                            )),
                      )
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
