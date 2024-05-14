// import 'package:flutter/material.dart';
// import 'package:servy_app/src/common/widgets/profile_user/widgets/action_section.dart';
// import 'package:servy_app/src/common/widgets/profile_user/widgets/info_section.dart';
// import 'package:servy_app/src/common/widgets/profile_user/widgets/title_section.dart';
// import 'package:servy_app/src/features/servy/models/service_model.dart';

// class PanelBody extends StatelessWidget {
//   final ScrollController controller;
//   final ServiceModel service;

//   const PanelBody({super.key, required this.controller, required this.service});

//   @override
//   Widget build(BuildContext context) {
//     double hPadding = 40;

//     return SingleChildScrollView(
//       controller: controller,
//       physics: const ClampingScrollPhysics(),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: hPadding),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TitleSection(
//                   username: service.username!,
//                   skills: service.skillsUser!,
//                 ),
//                 InfoSection(
//                   service: service,
//                 ),
//                 const SizedBox(height: 20),
//                 const ActionSection(),

//                 // StreamBuilder<QuerySnapshot>(
//                 //   stream: FirebaseFirestore.instance
//                 //       .collection('Services')
//                 //       .where('status', isEqualTo: 'accepted')
//                 //       .where('ownerId', isEqualTo: service.ownerId)
//                 //       .snapshots(),
//                 //   builder: (context, snapshot) {
//                 //     if (snapshot.connectionState == ConnectionState.waiting) {
//                 //       return const Center(child: CircularProgressIndicator());
//                 //     } else if (snapshot.hasError) {
//                 //       return Center(child: Text('Error: ${snapshot.error}'));
//                 //     } else {
//                 //       final List<DocumentSnapshot> documents =
//                 //           snapshot.data!.docs;
//                 //       if (documents.isEmpty) {
//                 //         return const Center(child: Text('No services found.'));
//                 //       }
//                 //       final List<ServiceModel> services = documents
//                 //           .map((doc) => ServiceModel.fromSnapshot(
//                 //               doc as QueryDocumentSnapshot))
//                 //           .toList();

//                 //       return Column(
//                 //         children: [
//                 //           GridView.builder(
//                 //             shrinkWrap: true,
//                 //             physics: const NeverScrollableScrollPhysics(),
//                 //             gridDelegate:
//                 //                 const SliverGridDelegateWithFixedCrossAxisCount(
//                 //               crossAxisCount: 2,
//                 //               crossAxisSpacing: 15.0,
//                 //               mainAxisSpacing: 15.0,
//                 //               childAspectRatio: 0.5,
//                 //             ),
//                 //             itemCount: services.length,
//                 //             itemBuilder: (context, index) {
//                 //               return ServiceAbstract(
//                 //                 title: services[index].title,
//                 //                 desc: services[index].descreption,
//                 //                 price: services[index].priceFrom,
//                 //                 priceFromDescount:
//                 //                     services[index].priceFromDescount,
//                 //                 imageUrl: services[index].imageService,
//                 //                 isLoadingImage: false,
//                 //                 serviceId: '',
//                 //                 service: services[index], // عرض الصورة المحملة
//                 //               );
//                 //             },
//                 //           ),
//                 //         ],
//                 //       );
//                 //     }
//                 //   },
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
