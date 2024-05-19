import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final Function(String) onSearchTextChanged;

  CustomSearchDelegate(this.onSearchTextChanged);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<ServiceModel>>(
      future: _searchServices(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<ServiceModel> services = snapshot.data ?? [];
          if (services.isEmpty) {
            return Center(
              child: Text('noResultsFound'.tr),
            );
          } else {
            return SuggestionList(services: services);
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<ServiceModel>>(
      future: _searchServices(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<ServiceModel> services = snapshot.data ?? [];
          if (services.isEmpty) {
            return Center(
              child: Text('noResultsFound'.tr),
            );
          } else {
            return SuggestionList(services: services);
          }
        }
      },
    );
  }

  Future<List<ServiceModel>> _searchServices(String query) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('Services')
              .where('title', isGreaterThanOrEqualTo: query)
              .where('title', isLessThan: '${query}z')
              .get();
      return snapshot.docs
          .map((doc) => ServiceModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      throw Exception('Error searching services: $e');
    }
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    onSearchTextChanged(query);
  }
}

class SuggestionList extends StatelessWidget {
  final List<ServiceModel> services;

  const SuggestionList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height /
                      1.1), // تحديد نسبة العرض إلى الارتفاع
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
      ),
    );
  }
}
