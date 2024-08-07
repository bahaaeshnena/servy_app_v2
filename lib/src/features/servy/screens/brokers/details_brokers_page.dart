import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/container_detailes.dart';
import 'package:servy_app/src/features/personalization/screens/settings/become_our_broker/become_our_broker.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class DetailsBrokersPage extends StatelessWidget {
  const DetailsBrokersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('detailsBrokers'.tr),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LottieBuilder.asset(TImages.contactSupport),
              ContainerDetailes(
                title: 'titleBrokers1'.tr,
                text: 'subTitle1'.tr,
              ),
              ContainerDetailes(
                title: 'titleBrokers2'.tr,
                text: 'subTitle2'.tr,
              ),
              ContainerDetailes(
                title: 'titleBrokers3'.tr,
                text: 'subTitle3'.tr,
              ),
              ContainerDetailes(
                title: 'title4'.tr,
                text: 'subTitle4'.tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'title5'.tr,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              LottieBuilder.asset(TImages.arrowDownst),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'subTitle5'.tr,
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () =>
                            Get.to(() => const BecomeourBrokerPage()),
                        child: Text(
                          'clickHere'.tr,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
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
