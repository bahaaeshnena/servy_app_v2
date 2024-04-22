import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('privacyPolicy'.tr),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('p1'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p2'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p3'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p4'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p5'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p6'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p7'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p8'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p9'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p10'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p11'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p12'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p13'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p14'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p15'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p16'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p17'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p18'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('p19'.tr, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
