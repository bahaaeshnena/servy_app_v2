import 'package:flutter/material.dart';
import 'package:servy_app/src/features/servy/screens/brokers/widgets/communication_brokers.dart';
import 'package:servy_app/src/features/servy/screens/brokers/widgets/describtions_Brokers.dart';
import 'package:servy_app/src/features/servy/screens/brokers/widgets/image_and_name_brokers.dart';

class CardBrokers extends StatelessWidget {
  const CardBrokers({
    super.key,
    required this.image,
    required this.name,
    required this.age,
    required this.country,
    required this.function,
    required this.describtions,
    required this.color,
    required this.onPressedEmail,
    required this.onPressedCall,
  });

  final String image;
  final String name;
  final String age;
  final String country;
  final String function;
  final String describtions;
  final Color color;
  final void Function() onPressedEmail;
  final void Function() onPressedCall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Column(
                children: [
                  ImageAndNameBrokers(
                    image: image,
                    name: name,
                    age: age,
                    country: country,
                    function: function,
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade200),
            DescribtionsBrokers(
              describtions: describtions,
            ),
            Divider(height: 1, color: Colors.grey.shade200),
            CommunicationBrokers(
              onPressedCall: onPressedCall,
              onPressedEmail: onPressedEmail,
            )
          ],
        ),
      ),
    );
  }
}
