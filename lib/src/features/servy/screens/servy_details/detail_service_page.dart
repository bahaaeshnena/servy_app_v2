import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/page_payment.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/widgets/user_profile_service_card.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/helpers/helper_function.dart';

class DetailServisePage extends StatelessWidget {
  const DetailServisePage({
    super.key,
    required this.service,
  });

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Detail Service'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: service.title,
              child: ClipRRect(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: screenWidth,
                  child: Image.network(
                    service.imageService,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TUserProfilsServiceCard(
                  onPressed: () {},
                  service: service,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20, vertical: 20),
                    child: Text(
                      service.title,
                      // style: const TextStyle(
                      //   fontWeight: FontWeight.w900,
                      //   fontSize: 20,
                      //   fontFamily: 'Poppins',
                      //   color: TColors.primaryColor,
                      // ),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
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
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            //!CorresService
            if (service.hasCorresService)
              Container(
                width: double.infinity,
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 20, vertical: 20),
                      child: Text(
                        'Corresponding service details',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.accent),
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
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
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
                          const Text(
                            'PRICE',
                            style: TextStyle(
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
                          child: const Text(
                            'PAY',
                            style: TextStyle(
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
