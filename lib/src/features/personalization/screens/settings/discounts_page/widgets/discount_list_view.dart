import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';

class DiscountServicesListView extends StatelessWidget {
  const DiscountServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Services').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          // استخراج قائمة الخدمات من البيانات المسترجعة
          List<ServiceModel> services = snapshot.data!.docs
              .map((doc) => ServiceModel.fromSnapshot(doc))
              .where((service) =>
                  service.hasDiscount == true && service.status == 'accepted')
              .toList();

          if (services.isEmpty) {
            return const Center(
                child: Text('No discounted services available'));
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceCardAbstract(
                  title: service.title,
                  desc: service.descreption,
                  price: service.priceFrom,
                  priceFromDescount: service.priceFromDescount,
                  imageUrl: service.imageService,
                  isLoadingImage: false,
                  serviceId: '', service: service, // عرض الصورة المحملة
                );
              },
            ),
          );
        }
      },
    );
  }
}
