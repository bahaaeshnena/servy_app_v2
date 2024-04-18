import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Contact Support'),
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
              'If you encounter technical problems or have been defrauded by a user or broker, or if you have suggestions or complaints, contact us.',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 50),
          CardContactSupport(
            color: const Color.fromARGB(255, 51, 159, 55),
            text: 'Whats App',
            image: TImages.whatsAppAnimation,
            onTap: () async {
              final Uri whatsApp = Uri.parse('https://wa.me/0792838813');
              await launchUrl(whatsApp);
            },
          ),
          const SizedBox(height: 30),
          CardContactSupport(
            color: const Color.fromARGB(255, 187, 58, 49),
            text: 'Email',
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

class CardContactSupport extends StatelessWidget {
  const CardContactSupport({
    super.key,
    required this.color,
    required this.text,
    required this.image,
    required this.onTap,
  });
  final Color color;
  final String text;
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          child: Row(
            children: [
              LottieBuilder.asset(image),
              const SizedBox(width: 30),
              Text(
                text,
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
