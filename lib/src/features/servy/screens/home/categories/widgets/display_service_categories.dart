import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';

class DisplayServiceCategories extends StatelessWidget {
  const DisplayServiceCategories({
    super.key,
    required this.filter,
  });
  final String filter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Services')
              .where('categoris', isEqualTo: filter)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<ServiceModel> services = snapshot.data!.docs
                  .map((doc) => ServiceModel.fromSnapshot(doc))
                  .where((service) => service.status == 'accepted')
                  .toList();
              if (services.isEmpty) {
                return const Center(
                  child: Text(
                    'No services available in this category.',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: services.map((service) {
                    return ServiceCardAbstract(
                      title: service.title,
                      desc: service.descreption,
                      price: service.priceFrom,
                      priceFromDescount: service.priceFromDescount,
                      imageUrl: service.imageService,
                      isLoadingImage: false,
                      serviceId: '',
                      service: service,
                    );
                  }).toList(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
