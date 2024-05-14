import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String username;
  final String skills;

  const TitleSection({super.key, required this.username, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              username,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'NimbusSanL',
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          skills,
          style: const TextStyle(
            fontFamily: 'NimbusSanL',
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
