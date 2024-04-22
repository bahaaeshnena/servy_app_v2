import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/contact_support/widgets/card_contact_suppport.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('contactSupport'.tr),
        showBackArrow: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(TImages.contactSupport,
              width: MediaQuery.of(context).size.width * 0.8),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'titleContactSupport'.tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 50),
          CardContactSupport(
            color: const Color.fromARGB(255, 51, 159, 55),
            text: 'whatsApp'.tr,
            image: TImages.whatsAppAnimation,
            onTap: () async {
              final Uri whatsApp = Uri.parse('https://wa.me/0792838813');
              await launchUrl(whatsApp);
            },
          ),
          const SizedBox(height: 30),
          CardContactSupport(
            color: const Color.fromARGB(255, 187, 58, 49),
            text: 'email'.tr,
            image: TImages.gmailAnimation,
            onTap: () async {
              final Uri url = Uri(
                scheme: 'mailto',
                path: 'eshnenabahaa@gmail.com',
              );
              await launchUrl(url);
            },
          ),
        ],
      ),
    );
  }
}
