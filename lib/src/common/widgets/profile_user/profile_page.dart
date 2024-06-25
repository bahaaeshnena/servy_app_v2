// import 'package:flutter/material.dart';
// import 'package:servy_app/src/common/widgets/appbar/appbar.dart';
// import 'package:servy_app/src/common/widgets/profile_user/widgets/panel_body.dart';
// import 'package:servy_app/src/features/servy/models/service_model.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// class ProfileServicePage extends StatelessWidget {
//   const ProfileServicePage({super.key, required this.service});
//   final ServiceModel service;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TAppBar(
//         title: Text('Profile'),
//         showBackArrow: true,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           FractionallySizedBox(
//             alignment: Alignment.topCenter,
//             heightFactor: 0.7,
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     service.userImage!,
//                   ),
//                   fit: BoxFit.cover, // تحديد كيفية تناسب الصورة داخل الحاوية
//                 ),
//               ),
//               // إضافة loadingBuilder للتحكم في عرض مؤقت أثناء تحميل الصورة
//               child: Image.network(
//                 service.userImage!,
//                 fit: BoxFit.cover,
//                 loadingBuilder: (BuildContext context, Widget child,
//                     ImageChunkEvent? loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               loadingProgress.expectedTotalBytes!
//                           : null,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           FractionallySizedBox(
//             alignment: Alignment.bottomCenter,
//             heightFactor: 0.3,
//             child: Container(
//               color: Colors.white,
//             ),
//           ),
//           SlidingUpPanel(
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(32),
//               topLeft: Radius.circular(32),
//             ),
//             minHeight: MediaQuery.of(context).size.height * 0.35,
//             maxHeight: MediaQuery.of(context).size.height * 0.85,
//             body: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 color: Colors.transparent,
//               ),
//             ),
//             panelBuilder: (ScrollController controller) => PanelBody(
//               controller: controller,
//               service: service,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
