import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';

class CustomLikeButton extends StatelessWidget {
  const CustomLikeButton({
    super.key,
    required this.service,
    required this.controller,
  });

  final ServiceModel service;
  final ServiceController controller;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 50,
      isLiked: service.isLikedState,
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.pink,
        dotSecondaryColor: Colors.white,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          CupertinoIcons.heart_fill,
          size: 40,
          color: isLiked ? Colors.red : Colors.grey[100],
        );
      },
      onTap: (isLiked) async {
        service.isLikedState = !isLiked;
        if (!isLiked) {
          controller.toggleFavorite(service);
        }
        return !isLiked;
      },
    );
  }
}
