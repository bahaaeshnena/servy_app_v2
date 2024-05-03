import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "recommendationForYou".tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Filter the list of services based on status
                List<ServiceModel> services = snapshot.data!.docs
                    .map((doc) => ServiceModel.fromSnapshot(doc))
                    .where((service) => service.status == 'accepted')
                    .toList();
                return Column(
                  children: services.map((service) {
                    return ServiceCardAbstract(
                      title: service.title,
                      desc: service.descreption,
                      price: service.priceFrom,
                      priceFromDescount: service.priceFromDescount,
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
