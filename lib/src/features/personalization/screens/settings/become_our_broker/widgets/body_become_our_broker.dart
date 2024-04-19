import 'package:flutter/material.dart';
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
              'Description',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: TColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'A broker is a person whose job is to guarantee the rights of all parties through the process of receiving and delivering work and money to people.',
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
            'How it works',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 215,
              decoration: BoxDecoration(
                color: TColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'We display your information on the brokers page, and people who need a broker to guarantee the service contact you. After communicating with you and agreeing on the details, you deliver the work and money and guarantee the quality of work for both parties.',
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
            'Profit mechanism',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: TColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                textAlign: TextAlign.center,
                'The method of profit is by requesting a certain percentage from both parties or requesting a specific amount that is based on the service offered and the amount.',
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
