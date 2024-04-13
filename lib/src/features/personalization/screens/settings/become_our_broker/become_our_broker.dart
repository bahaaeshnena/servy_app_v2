import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/personalization/screens/settings/become_our_broker/widgets/body_become_our_broker.dart';

class BecomeourBrokerPage extends StatelessWidget {
  const BecomeourBrokerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Become our Broker'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BodyBecomeourBroker(),
        ),
      ),
    );
  }
}
