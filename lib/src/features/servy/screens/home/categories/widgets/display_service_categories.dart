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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                  return Center(
                    child: Text(
                      'No services available in this category.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return ServiceAbstract(
                          // هنا قمت بتغيير الويدجت المستخدمة
                          title: services[index].title,
                          desc: services[index].descreption,
                          price: services[index].priceFrom,
                          priceFromDescount: services[index].priceFromDescount,
                          imageUrl: services[index].imageService,
                          isLoadingImage: false,
                          serviceId: '',
                          service: services[index], // عرض الصورة المحملة
                        );
                      },
                    )
                  ]),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
