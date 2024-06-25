import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/features/personalization/screens/settings/become_our_broker/widgets/container_form.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmissionBrokerForm extends StatelessWidget {
  const SubmissionBrokerForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'submissionToBroker'.tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 60),
            decoration: BoxDecoration(
              color: TColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'subSubmissionToBroker'.tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        Lottie.asset(TImages.arrowDownst,
            width: MediaQuery.of(context).size.width * 0.4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ContainerForm(
                onTap: () async {
                  var url = Uri.https('forms.office.com', 'r/h2xDyk3F80');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                title: 'Form in Arabic',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ContainerForm(
                onTap: () async {
                  var url = Uri.https('forms.office.com', '/r/bpiaKgUarD');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                title: 'Form in English',
              ),
            ),
          ],
        )
      ],
    );
  }
}
