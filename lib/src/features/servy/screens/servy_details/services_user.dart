import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';

class ServicesUserPublish extends StatelessWidget {
  const ServicesUserPublish({super.key, required this.service});

  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('My Works'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Services')
                    .where('status', isEqualTo: 'accepted')
                    .where('ownerId', isEqualTo: service.ownerId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    if (documents.isEmpty) {
                      return const Center(child: Text('No services found.'));
                    }
                    final List<ServiceModel> services = documents
                        .map((doc) => ServiceModel.fromSnapshot(
                            doc as QueryDocumentSnapshot))
                        .toList();

                    return Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 15.0,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.2),
                          ),
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            return ServiceAbstract(
                              title: services[index].title,
                              desc: services[index].descreption,
                              price: services[index].priceFrom,
                              priceFromDescount:
                                  services[index].priceFromDescount,
                              imageUrl: services[index].imageService,
                              isLoadingImage: false,
                              serviceId: '',
                              service: services[index], // عرض الصورة المحملة
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
