// import 'package:codefactory/pages/main/course_view_model.dart';
// import 'package:flutter/material.dart';
//
// import 'course/course_add.dart';
// import '../course/course_page.dart';
//
// class KhoaHoc {
//   String ten = '';
//   String thoiGian = '';
//   String moTa = '';
//
//   KhoaHoc(
//     this.ten,
//     this.thoiGian,
//     this.moTa,
//   );
// }
//
// class CourseView extends StatelessWidget {
//   final items = List<KhoaHoc>.generate(
//     30,
//     (i) => KhoaHoc('Khoa hoc $i', '2020/10/${i + 1}', 'Mo ta $i'),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.deepOrange),
//             ),
//             child: Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//             width: 48,
//             height: 48,
//           ),
//           onPressed: () => Scaffold.of(context).openDrawer(),
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         title: Text(
//           "Your Course",
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//             fontSize: 24,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () => showDialog(
//               context: context,
//               builder: (context) => CourseAdd(),
//               barrierDismissible: true,
//             ),
//             icon: Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return ItemKhoaHoc(
//             khoaHoc: this.items[index],
//           );
//         },
//
//       ),
//
//     );
//   }
// }
