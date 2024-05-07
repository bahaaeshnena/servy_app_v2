import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/brokers/details_brokers_page.dart';
import 'package:servy_app/src/features/servy/screens/brokers/widgets/card_brokers.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class BrokersPage extends StatelessWidget {
  const BrokersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('brokers'.tr),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'brokersTitle'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'forMoreDetails'.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const DetailsBrokersPage()),
                    child: Text(
                      'clickHere'.tr,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //? bahaa
              CardBrokers(
                color: TColors.primaryColor,
                image: TImages.brokersBahaa,
                name: 'bahaa eshnena',
                age: '22',
                country: 'jordan',
                function: 'Programming',
                describtions:
                    'I am a certified broker with Servy. I have experience in developing mobile applications in the Flutter language',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'eshnenabahaa@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0792838813',
                  );
                  await launchUrl(url);
                },
              ),
              //? Fares

              CardBrokers(
                color: TColors.accent,
                image: TImages.brokersFares,
                name: 'fares Abughazaleh',
                age: '23',
                country: 'jordan',
                function: 'Programming',
                describtions:
                    'I am a certified broker with Servy. I have experience in developing mobile applications using React',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'fares@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0789042711',
                  );
                  await launchUrl(url);
                },
              ),
              //? Saif

              CardBrokers(
                color: TColors.primaryColor,
                image: TImages.brokersSaif,
                name: 'Saif Abu Mater',
                age: '22',
                country: 'jordan',
                function: 'Programming',
                describtions:
                    'I am a certified broker with Servy. I have experience in developing pages and websites using (html, css, js, php, node js)',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'saif@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0796835109',
                  );
                  await launchUrl(url);
                },
              ),
              //? hamza
              CardBrokers(
                color: TColors.accent,
                image: TImages.brokersHamza,
                name: 'Hamza Haitham',
                age: '22',
                country: 'jordan',
                function: 'Programming',
                describtions:
                    'I am a certified broker with Servy. I have experience in developing pages and websites using Asp.net',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'hamza@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0795358186',
                  );
                  await launchUrl(url);
                },
              ),
              //? Mohammed

              CardBrokers(
                color: TColors.primaryColor,
                image: TImages.brokersMohammed,
                name: 'Mohammed eshnena',
                age: '22',
                country: 'jordan',
                function: 'Design ',
                describtions:
                    'I am a certified broker with Servy. I have experience in the field of editing photos, creating animations, and editing photos',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'mohammed@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0797508262',
                  );
                  await launchUrl(url);
                },
              ),
              //? majed

              CardBrokers(
                color: TColors.accent,
                image: TImages.brokersMajed,
                name: 'Majed Alsotary',
                age: '26',
                country: 'jordan',
                function: 'Programming',
                describtions:
                    'I am a certified broker with Servy. I have experience in developing games on the Unity engine using the C# language.',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'majed@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0795257648',
                  );
                  await launchUrl(url);
                },
              ),
              //? Osama alsotary

              CardBrokers(
                color: TColors.primaryColor,
                image: TImages.brokersOsama,
                name: 'Osama alsotary',
                age: '24',
                country: 'jordan',
                function: 'Dsign',
                describtions:
                    'I am a certified broker with Servy. I have experience in the field of video editing, creating animated videos, and advertising videos',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'osama@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0778060126',
                  );
                  await launchUrl(url);
                },
              ),
              //? salah
              CardBrokers(
                color: TColors.accent,
                image: TImages.brokersSalah,
                name: 'Salah Mohammad',
                age: '23',
                country: 'jordan',
                function: 'Marketing',
                describtions:
                    'I am a certified broker with Servy. I have experience in the field of electronic marketing',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'salah@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0782726064',
                  );
                  await launchUrl(url);
                },
              ),
              //? Ali Herzalla
              CardBrokers(
                color: TColors.primaryColor,
                image: TImages.brokersAli,
                name: 'Ali Herzalla',
                age: '25',
                country: 'jordan',
                function: 'Programming',
                describtions:
                    'I am a certified broker with Servy. I have experience in designing databases with Oracle',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'ali@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0788136390',
                  );
                  await launchUrl(url);
                },
              ),
              //? Dawood
              CardBrokers(
                color: TColors.accent,
                image: TImages.brokersDawood,
                name: 'Dawood Baidas',
                age: '24',
                country: 'jordan',
                function: 'Design',
                describtions:
                    'I am a certified broker with Servy. I have experience in the field of professional logo design and PowerPoint file design',
                onPressedEmail: () async {
                  final Uri url = Uri(
                    scheme: 'mailto',
                    path: 'ali@gmail.com',
                  );
                  await launchUrl(url);
                },
                onPressedCall: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: '0788136390',
                  );
                  await launchUrl(url);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
