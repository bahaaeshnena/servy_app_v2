import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/discounts_page/widgets/discount_list_view.dart';

class DiscountsScreen extends StatelessWidget {
  const DiscountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('titleOption6'.tr),
        showBackArrow: true,
      ),
      body: const DiscountServicesListView(),
    );
  }
}
