import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';

class RatingAndCommentsPage extends StatelessWidget {
  const RatingAndCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Rating And Comments'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
