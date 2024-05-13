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
      physics: const ClampingScrollPhysics(),
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

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.6, // تحديد نسبة العرض إلى الارتفاع
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
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
