import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/container_detailes.dart';
import 'package:servy_app/src/features/personalization/screens/settings/become_our_broker/become_our_broker.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/texts.dart';

class DetailsBrokersPage extends StatelessWidget {
  const DetailsBrokersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Details Brokers'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.asset(TImages.contactSupport),
              const ContainerDetailes(
                text:
                    'A broker is someone who works for us and is certified by our application to manage the process of buying, selling and exchanging services',
                title: 'Who is the Broker?',
              ),
              const ContainerDetailes(
                text:
                    'The brokers main function is to assist users and service owners in the process of delivering and receiving work Money, guaranteeing the rights of every person, and eliminating cases of fraud.',
                title: 'Brokers main function',
              ),
              const ContainerDetailes(
                text:
                    'When the mediator completes his task, he asks the two people for an amount of money or a certain percentage that is agreed upon with both parties.',
                title: 'After completing the task',
              ),
              const ContainerDetailes(
                text:
                    'The mediator system is not obligatory for each user and the method he prefers in dealing with other users.',
                title: 'Note',
              ),
              Text(
                'To become a broker',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              LottieBuilder.asset(TImages.arrowDownst),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'To become our approved broker',
                    // style: Theme.of(context).textTheme.bodyMedium,
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () =>
                          Get.to(() => const BecomeourBrokerPage()),
                      child: const Text(
                        TText.clickHere,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
