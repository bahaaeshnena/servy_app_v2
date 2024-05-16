import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/page_payment.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/profile_user_publish.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/widgets/format_text_reating.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/widgets/user_profile_service_card.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';
import 'package:servy_app/src/utils/shimmer/shimmer_effect.dart';

class DetailServisePage extends StatelessWidget {
  const DetailServisePage({
    super.key,
    required this.service,
  });

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    ServiceController controller = Get.put(ServiceController());

    return Scaffold(
      appBar: TAppBar(
        title: Text('titleDetailService'.tr),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: service.title,
              child: Obx(() {
                // ignore: unused_local_variable
                final networkImage = controller.services.value.imageService;

                return ClipRRect(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.8,
                    width: screenWidth,
                    child: Image.network(
                      service.imageService,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return TShimmerEffect(
                          width: screenWidth,
                          height: MediaQuery.of(context).size.height / 2.8,
                          radius: 0,
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
            Container(
              height: 70,
              width: double.infinity,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.darkContainer
                  : Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TUserProfilsServiceCard(
                  icon: Iconsax.user,
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 600,
                          child: ProfileUserPublish(service: service),
                        );
                      },
                    );
                  },
                  service: service,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.2,
                  ),
                ),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20, vertical: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.star,
                          size: 30,
                          color: TColors.primaryColor,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              'rate'.tr,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              service.ratingService.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20, vertical: 20),
                    child: Text(
                      service.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.primaryColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth / 20, bottom: 20, right: 20),
                    child: ReadMoreText(
                      service.descreption,
                      trimLines: 4,
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
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.darkContainer
                  : Colors.grey.shade200,
            ),
            if (service.hasCorresService)
              Container(
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 20, vertical: 20),
                      child: Text(
                        'possibilityOfInterviewService'.tr,
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 20, vertical: 20),
                      child: Text(
                        service.corssPodingService!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.primaryColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth / 20, bottom: 20, right: 20),
                      child: ReadMoreText(
                        service.descrCorssPodingService!,
                        trimLines: 4,
                        trimMode: TrimMode.Line,
                        trimExpandedText: ' show less',
                        trimCollapsedText: ' show more',
                        moreStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        lessStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              height: 15,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.darkContainer
                  : Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'rateService'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        return RatingBarIndicator(
                          rating: controller.rating.value,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 50.0,
                          direction: Axis.horizontal,
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    inputFormatters: [RangeInputFormatter(min: 1, max: 5)],
                    controller: controller.ratingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'rate'.tr,
                      prefixIcon: const Icon(Iconsax.star),
                      prefixIconColor: TColors.primaryColor,
                    ),
                    onChanged: (value) {
                      controller.updateRating(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        // استدعاء دالة حفظ التقييم هنا
                        controller.saveRatingToFirestore(service
                            .serviceID); // حيث أنه يجب عليك تمرير معرف الخدمة إلى هذه الدالة
                      },
                      child: Text('rate'.tr),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'price'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                          if (service.hasDiscount)
                            Text(
                              service.priceFromDescount!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            )
                          else
                            Text(
                              service.priceFrom,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: TextButton(
                          onPressed: () => Get.to(() => const PaymentPage()),
                          style: TextButton.styleFrom(
                            backgroundColor: TColors.primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'pay'.tr,
                            style: const TextStyle(
                              fontFamily: 'NimbusSanL',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
