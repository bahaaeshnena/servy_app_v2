import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/controller/comments_controller.dart';
import 'package:servy_app/src/features/servy/models/service_model.dart';
import 'package:servy_app/src/features/servy/screens/servy_details/widgets/format_text_reating.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class AddComment extends StatelessWidget {
  const AddComment({super.key, required this.serviceID});
  final ServiceModel serviceID;
  @override
  Widget build(BuildContext context) {
    CommentController controller = Get.put(CommentController());
    // ServiceController controllerService = Get.put(ServiceController());

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add comment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return RatingBarIndicator(
                      rating: controller.rating.value,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 50.0,
                      direction: Axis.horizontal,
                    );
                  }),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.ratingController,
                inputFormatters: [RangeInputFormatter(min: 1, max: 5)],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  prefixIcon: Icon(Iconsax.star),
                  prefixIconColor: TColors.primaryColor,
                ),
                onChanged: (value) {
                  controller.updateRating(value);
                },
              ),
              const SizedBox(height: 10),
              const TextField(
                minLines: 1,
                maxLines: 20,
                decoration: InputDecoration(
                  labelText: 'Comment',
                  prefixIcon: Icon(Iconsax.star),
                  prefixIconColor: TColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await Get.find<CommentController>()
                        .saveRatingToFirestore(serviceID.ownerId!);
                  },
                  child: const Text('Comment & Rate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
