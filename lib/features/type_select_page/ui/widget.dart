// import 'package:flutter/material.dart';
//
// class furnitureTypesWidget extends StatelessWidget {
//   final  furnitureTypes;
//    furniture({super.key, required this.furnitureTypes});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 89,
//             height: 89,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.grey[200],
//             ),
//             child: Center(
//               child: Image.asset(
//                 'assets/images/${furnitureType.previewImage}',
//                 width: 120,
//                 height: 120,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             furnitureType.name,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
