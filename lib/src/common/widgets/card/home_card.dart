import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: const Color(0x00fcf9f8),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {},
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
              const Row(
                children: [
                  Text(
                    'web Application',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 50),
                  Icon(Iconsax.star1,
                      size: 25, color: Color.fromARGB(255, 255, 230, 0)),
                  Text(
                    ' 4.5',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 15.0),
              Text(
                'Programming websites and systems in PHP + MYSQL professionally',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 23.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'From 5.00\$',
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.heart4,
                        size: 28,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
