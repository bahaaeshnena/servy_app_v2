import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/common/widgets/card/service_card_abstract.dart';

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
    return Container(); // We'll display results in SuggestionList
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
            return const Center(
              child: Text('No results found'),
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
      child: Column(
        children: services.map((service) {
          return ServiceCardAbstract(
            title: service.title,
            desc: service.descreption,
            price: service.priceFrom,
            priceFromDescount: service.priceFromDescount,
            imageUrl: service.imageService,
            isLoadingImage: false,
            serviceId: '', service: service, // عرض الصورة المحملة
          );
        }).toList(),
      ),
    );
  }
}
