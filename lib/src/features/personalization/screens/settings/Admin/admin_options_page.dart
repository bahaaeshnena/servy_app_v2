import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/Admin/widget/container_admin.dart';
import 'package:servy_app/src/utils/constants/images.dart';

class AdminOptionsPage extends StatelessWidget {
  const AdminOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("adminOptions".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              LottieBuilder.asset(TImages.adminOptions),
              Text(
                'On this page you can manage, accept and reject user services and manage brokers',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerAdmin(
                    title: 'Services',
                    onTap: () {},
                  ),
                  ContainerAdmin(
                    title: 'Brokers',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
