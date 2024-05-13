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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
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
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
