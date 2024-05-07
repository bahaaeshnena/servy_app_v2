import 'package:flutter/material.dart';

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
    return Container(); // Implement your search results UI here
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can build suggestions here based on query
    return Container(); // Implement your search suggestions UI here
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    onSearchTextChanged(query);
  }
}
