import 'package:flutter/material.dart';

class DescribtionsBrokers extends StatelessWidget {
  const DescribtionsBrokers({
    super.key,
    required this.describtions,
  });
  final String describtions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            'describtions :',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            describtions,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
