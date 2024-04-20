import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/card/home_card.dart';

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
          SizedBox(
            height: 360,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 7,
              itemBuilder: (context, index) => const HomeCard(),
            ),
          )
        ],
      ),
    );
  }
}
