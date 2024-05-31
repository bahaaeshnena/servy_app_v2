import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/controllers/brokers_controller.dart';

class ContainerImageBroker extends StatelessWidget {
  const ContainerImageBroker({
    super.key,
  });

  Future<void> _pickImage() async {
    Get.find<BrokersController>().pickImage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(),
      child: GetBuilder<BrokersController>(
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
                        'Add Broker Image',
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
