// import 'package:flutter/material.dart';
// import 'package:servy_app/src/features/servy/models/service_model.dart';

// class InfoSection extends StatelessWidget {
//   const InfoSection({
//     super.key,
//     required this.service,
//   });
//   final ServiceModel service;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           flex: 3,
//           child: _buildInfoCell(title: 'Post', value: '1'),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Container(
//             width: 1,
//             height: 40,
//             color: Colors.grey,
//           ),
//         ),
//         Expanded(
//           flex: 3,
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: () {},
//                 child: Image.asset(
//                   'assets/images/profile/customer_review.png',
//                   width: 55,
//                   height: 55,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Container(
//             width: 1,
//             height: 40,
//             color: Colors.grey,
//           ),
//         ),
//         Expanded(
//           flex: 3,
//           child: _buildInfoCell(title: 'Location', value: service.countryUser!),
//         ),
//       ],
//     );
//   }

//   Widget _buildInfoCell({required String title, required String value}) {
//     return Column(
//       children: <Widget>[
//         Text(
//           title,
//           style: const TextStyle(
//             fontFamily: 'OpenSans',
//             fontWeight: FontWeight.w300,
//             fontSize: 14,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//             fontFamily: 'OpenSans',
//             fontWeight: FontWeight.w700,
//             fontSize: 14,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }
