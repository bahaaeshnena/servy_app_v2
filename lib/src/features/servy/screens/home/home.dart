import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:servy_app/src/features/servy/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // drawer: ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
