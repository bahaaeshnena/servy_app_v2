import 'package:flutter/material.dart';

class ImageAndNameBrokers extends StatelessWidget {
  const ImageAndNameBrokers({
    super.key,
    required this.image,
    required this.name,
    required this.age,
    required this.country,
    required this.function,
  });
  final String image;
  final String name;
  final String age;
  final String country;
  final String function;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 9.0, left: 9.0),
                  child: Image.network(
                    image,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 40),
                  child: Column(
                    children: [
                      Text(
                        'Age : $age',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Country : $country',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Fun : $function',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
