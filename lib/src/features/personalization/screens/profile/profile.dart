import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
import 'package:servy_app/src/common/widgets/images/circular_image.dart';
import 'package:servy_app/src/common/widgets/texts/section_heading.dart';
import 'package:servy_app/src/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:servy_app/src/utils/constants/images.dart';
import 'package:servy_app/src/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        //profile picture
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 100,
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Profile Info

              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'Name',
                value: "Bahaa Eshnena",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Username',
                value: "BAx1",
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Personal Info

              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'User ID',
                icon: Iconsax.copy,
                value: "1234",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'E-Mail',
                value: "bahaa@gmail.com",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: "0792838813",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: "Male",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Country',
                value: "Jordan",
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Skills Info

              const TSectionHeading(
                  title: 'Skills Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Skills 1',
                value: "Android Application",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Skills 2',
                value: "Flutter developer",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Skills 3',
                value: "Logo design",
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Skills 4',
                value: "Video Editing ",
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        //Details
      ),
    );
  }
}
