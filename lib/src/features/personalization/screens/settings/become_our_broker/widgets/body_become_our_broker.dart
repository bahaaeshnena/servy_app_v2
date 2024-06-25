import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/features/personalization/screens/settings/become_our_broker/widgets/submission_broker_form.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class BodyBecomeourBroker extends StatelessWidget {
  const BodyBecomeourBroker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Lottie.asset(TImages.contactSupport,
              width: MediaQuery.of(context).size.width * 0.8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'description'.tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Container(
            constraints: const BoxConstraints(minHeight: 60),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: TColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'subDescription'.tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 20,
            ),
          ),
          Text(
            'howItWorks'.tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: const BoxConstraints(minHeight: 60),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: TColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'subHowItWorks'.tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 20,
            ),
          ),
          Text(
            'profitMechanism'.tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: const BoxConstraints(minHeight: 60),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: TColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'subProfitMechanism'.tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 20,
            ),
          ),
          const SubmissionBrokerForm(),
        ],
      ),
    );
  }
}
