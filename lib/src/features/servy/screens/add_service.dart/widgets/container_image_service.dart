import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/servy/controller/service_controller.dart';

class ContainerImageService extends StatelessWidget {
  const ContainerImageService({
    super.key,
  });

  Future<void> _pickImage() async {
    Get.find<ServiceController>().pickImage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(),
      child: GetBuilder<ServiceController>(
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              image: controller.imageFile != null
                  ? DecorationImage(
                      image: FileImage(controller.imageFile!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: controller.imageFile == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image_outlined,
                        size: 150,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'addImageService'.tr,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }
}
