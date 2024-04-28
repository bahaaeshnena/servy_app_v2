import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/product_detail.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.price});
  final String title;
  final String desc;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: const Color(0x00fcf9f8),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: InkWell(
          onTap: () => Get.to(() => const ServyDtailsScreen()),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200,
                    image: const DecorationImage(
                      image: AssetImage(TImages.card),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 50),
                    const Icon(Iconsax.star1,
                        size: 25, color: Color.fromARGB(255, 255, 230, 0)),
                    const Text(
                      '4.5',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(height: 15.0),
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 23.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$price \$',
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.heart5,
                        color: Colors.red,
                        size: 33,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
