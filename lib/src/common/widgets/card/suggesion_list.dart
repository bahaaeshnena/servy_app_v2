import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({super.key});

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
            stream: FirebaseFirestore.instance
                .collection('Services')
                .where('status', isEqualTo: 'accepted')
                .where('hasDiscount', isEqualTo: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                if (documents.isEmpty) {
                  return const Center(child: Text('No services found.'));
                }
                final List<ServiceModel> services = documents
                    .map((doc) =>
                        ServiceModel.fromSnapshot(doc as QueryDocumentSnapshot))
                    .toList();

                return Column(
                  children: services.map((service) {
                    return ServiceCardAbstract(
                      title: service.title,
                      desc: service.descreption,
                      price: service.priceFrom,
                      priceFromDescount: service.priceFromDescount,
                      imageUrl: service.imageService,
                      isLoadingImage: false,
                      serviceId: '',
                      service: service, // عرض الصورة المحملة
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
