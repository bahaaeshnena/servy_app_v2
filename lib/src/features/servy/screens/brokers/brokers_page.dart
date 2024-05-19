import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/brokers/details_brokers_page.dart';
import 'package:servy_app/src/features/servy/screens/brokers/widgets/card_brokers.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/network/loaders.dart';

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
                  await FireData().createRoom('eshnenabahaa@gmail.com');
                  TLoaders.successSnackBar(
                      title: 'Done',
                      message:
                          'A chat room has been created between you and the broker on the chat page');
                },
                email: 'eshnenabahaa@gmail.com',
              ),

              // //? hamza
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
                  await FireData().createRoom('hamzaenim443@gmail.com');
                  TLoaders.successSnackBar(
                      title: 'Done',
                      message:
                          'A chat room has been created between you and the broker on the chat page');
                },
                email: 'hamzaenim443@gmail.com',
              ),
              // //? Saif

              CardBrokers(
                color: TColors.primaryColor,
                image: TImages.brokersSaif,
                name: 'Saif Abu Mater',
                age: '22',
                country: 'jordan',
                function: 'Programming',
                describtions:
                    'I am a certified broker with Servy. I have experience in developing pages and websites using (html, css, js, php, node js)',
                email: 'Saifaabumatar@gmail.com',
                onPressedEmail: () async {
                  await FireData().createRoom('Saifaabumatar@gmail.com');
                  TLoaders.successSnackBar(
                      title: 'Done',
                      message:
                          'A chat room has been created between you and the broker on the chat page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
