import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/features/servy/screens/chat/widgets/chat_card.dart';
import 'package:servy_app/src/utils/constants/colors.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';
import 'package:servy_app/src/utils/validators/validation.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Chat Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        children: [Text('Enter Person Name')],
                      ),
                      const SizedBox(height: TSizes.inputFieldRadius),
                      TextFormField(
                        validator: (value) =>
                            TValidator.volidateEmptyText('Person Name', value),
                        decoration: const InputDecoration(
                          labelText: 'Person Name',
                          prefixIcon: Icon(Iconsax.search_normal_1),
                          prefixIconColor: TColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: TSizes.inputFieldRadius),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Create Chat')),
                      )
                    ],
                  ),
                );
              });
        },
        child: const Icon(Iconsax.message_add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ChatCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
