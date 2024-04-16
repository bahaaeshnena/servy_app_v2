import 'package:flutter/material.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Privacy Policy'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Date of last update: [16/04/2024]',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'Thank you for using [ Servy App ] (“We”, “Servy App”). In this Policy, we explain how we collect, use and share the information you provide to us when you use the App. By using this application, you agree to this policy and its terms.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('1. Information we collect',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'When you use the App, we may collect the following information:',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'Personal information: such as the name, email address and phone number you provided while registering or using the application. Device information: such as the type of device, operating system, and browser you use when accessing the app. Usage information: such as interactions with content in the app, services you use, and interactions with ads.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('2. How we use the information',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'We use the information we collect for the following purposes:',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'Improve the App: We use information to analyze how users use the App and improve the user experience. Providing Services: We use information to provide the services users request and customize the experience based on their needs. Communicating with Users: We may use contact information to send notifications about updates, special offers, and app news.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('3. Share information',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'We do not sell or trade users personal information to third parties. However, we may share information with partners who help us operate and improve the App, such as cloud service providers and analytics companies.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'Personal information: such as the name, email address and phone number you provided while registering or using the application. Device information: such as the type of device, operating system, and browser you use when accessing the app. Usage information: such as interactions with content in the app, services you use, and interactions with ads.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('4. Security', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'We take appropriate security measures to protect personal information from unauthorized access, use, modification or disclosure.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('5. Users choices',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'Users have the right to request access to the personal information we hold and to request that it be corrected, deleted or restricted. Users may also opt out of receiving marketing communications from us.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('6. Changes in policy',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'We may update this policy from time to time, and we will post any changes on this page. Please check this page periodically for our latest privacy information.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('7. Communication',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(
                  'If you have any questions or inquiries about our Privacy Policy, please contact us via email: eshnenabahaa@gmail.com.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
