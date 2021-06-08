// import 'package:flutter/material.dart';
//
// import 'package:codefactory/pages/main/course_view.dart';
//
// import '../course/course_page.dart';
//
// class ItemKhoaHoc extends StatelessWidget {
//   final KhoaHoc khoaHoc;
//   const ItemKhoaHoc({
//     Key? key,
//     required this.khoaHoc,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: OutlinedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CoursePage(),
//                 ),
//               );
//             },
//             style: ButtonStyle(
//               shape: MaterialStateProperty.all(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 343,
//                   height: 194,
//                   color: Colors.red,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         khoaHoc.thoiGian,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12,
//                             color: Colors.green),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         khoaHoc.ten,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 24,
//                             color: Colors.black),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         khoaHoc.moTa,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14,
//                             color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//
//       ],
//     );
//
//   }
// }
