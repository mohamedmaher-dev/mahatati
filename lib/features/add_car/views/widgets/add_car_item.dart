// import 'package:flutter/material.dart';
// import '../../../../core/consts.dart';

// class AddCarItem extends StatelessWidget {
//   const AddCarItem({super.key, required this.controller});
//   final TextEditingController controller;
//   final bool isNumber;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         label: Text(controller.isNumber ? "رمز QR" : "الرقم"),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(
//               kValueRound,
//             ),
//           ),
//         ),
//         prefixIcon: Icon(
//           controller.isNumber
//               ? Icons.qr_code_rounded
//               : Icons.onetwothree_rounded,
//         ),
//       ),
//     );
//   }
// }
