// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:codefactory/pages/main/course/course_page.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:localstore/localstore.dart';
// //
// // import 'course_model.dart';
// // import 'edit_course_page.dart';
// //
// // class CourseListPage extends StatefulWidget {
// //   @override
// //   _CourseListPageState createState() => _CourseListPageState();
// // }
// //
// // class _CourseListPageState extends State<CourseListPage> {
// //   final _db = FirebaseFirestore.instance;
// //   final _items = <String, CourseModel>{};
// //
// //   final courseRef = FirebaseFirestore.instance.collection('course').doc();
// //
// //   @override
// //   void initState() {
// //     // _db.collection('course').stream.listen((event) {
// //     //   setState(() {
// //     //     final item = CourseModel.fromMap(event);
// //     //     _items.putIfAbsent(item.id!, () => item);
// //     //   });
// //     // });
// //     // _db.collectionGroup('course').snapshots().listen((event) {
// //     //   setState(() {
// //     //         final item = CourseModel.fromMap(event);
// //     //         _items.putIfAbsent(item.id!, () => item);
// //     //       });
// //     // });
// //     // FirebaseFirestore.instance
// //     //     .collection('users')
// //     //     .get()
// //     //     .then((QuerySnapshot querySnapshot) {
// //     //   querySnapshot.docs.forEach((doc) {
// //     //     print(doc["first_name"]);
// //     //   });
// //     // });
// //     super.initState();
// //   }
// //
// //   getCourse() {
// //     FirebaseFirestore.instance
// //         .collection('course')
// //         .get()
// //         .then((QuerySnapshot querySnapshot) {
// //       querySnapshot.docs.forEach((doc) {
// //         print(doc["title"]);
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.add),
// //             onPressed: () {
// //               Navigator.of(context).push(MaterialPageRoute(
// //                   builder: (context) => EditCoursePage(course: null)));
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           // ListView.builder(
// //           //   itemCount: _items.entries.length,
// //           //   itemBuilder: (context, index) {
// //           //     final key = _items.keys.elementAt(index);
// //           //     final item = _items[key]!;
// //           //     return Column(
// //           //       children: [
// //           //         Padding(
// //           //           padding: const EdgeInsets.all(16.0),
// //           //           child: OutlinedButton(
// //           //             onPressed: () {
// //           //               Navigator.push(
// //           //                 context,
// //           //                 MaterialPageRoute(
// //           //                   builder: (context) => CoursePage(),
// //           //                 ),
// //           //               );
// //           //             },
// //           //             style: ButtonStyle(
// //           //               shape: MaterialStateProperty.all(
// //           //                 RoundedRectangleBorder(
// //           //                   borderRadius: BorderRadius.circular(8.0),
// //           //                 ),
// //           //               ),
// //           //             ),
// //           //             child: Column(
// //           //               crossAxisAlignment: CrossAxisAlignment.start,
// //           //               children: [
// //           //                 Container(
// //           //                   width: 343,
// //           //                   height: 194,
// //           //                   color: Colors.red,
// //           //                 ),
// //           //                 Padding(
// //           //                   padding: const EdgeInsets.all(16.0),
// //           //                   child: Column(
// //           //                     crossAxisAlignment: CrossAxisAlignment.start,
// //           //                     mainAxisAlignment: MainAxisAlignment.start,
// //           //                     children: [
// //           //                       // Text(
// //           //                       //   khoaHoc.thoiGian,
// //           //                       //   style: TextStyle(
// //           //                       //       fontWeight: FontWeight.w500,
// //           //                       //       fontSize: 12,
// //           //                       //       color: Colors.green),
// //           //                       // ),
// //           //                       SizedBox(
// //           //                         height: 8,
// //           //                       ),
// //           //                       Text(
// //           //                         '${item.title}',
// //           //                         style: TextStyle(
// //           //                             fontWeight: FontWeight.w500,
// //           //                             fontSize: 24,
// //           //                             color: Colors.black),
// //           //                       ),
// //           //                       SizedBox(
// //           //                         height: 8,
// //           //                       ),
// //           //                       Text(
// //           //                         '${item.desc}',
// //           //                         style: TextStyle(
// //           //                             fontWeight: FontWeight.w400,
// //           //                             fontSize: 14,
// //           //                             color: Colors.grey),
// //           //                       ),
// //           //                     ],
// //           //                   ),
// //           //                 ),
// //           //               ],
// //           //             ),
// //           //           ),
// //           //         ),
// //           //
// //           //       ],
// //           //     );
// //           //   },
// //           // ),
// //           ElevatedButton(onPressed: getCourse(), child: Text('Fetch'))
// //
// //
// //         ],
// //       ),
// //     );
// //   }
// //
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:codefactory/example/localstore/course/course_add.dart';
// import 'package:flutter/material.dart';
//
// import 'edit_course_page.dart';
//
// class CourseListPage extends StatefulWidget {
//   @override
//   _CourseListPageState createState() => _CourseListPageState();
// }
//
// class _CourseListPageState extends State<CourseListPage> {
//   final firestoreDB = FirebaseFirestore.instance.collection('course').snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () => showDialog(
//               context: context,
//               builder: (context) => CourseEdit(),
//               barrierDismissible: true,
//             ),
//           ),
//         ],
//       ),
//       body: StreamBuilder <QuerySnapshot>(
//         stream: firestoreDB,
//         builder: (context, snapshot){
//           if(!snapshot.hasData) return CircularProgressIndicator();
//           return ListView.builder(
//             itemCount: (snapshot.data! as QuerySnapshot).docs.length,
//               //(snapshot.data! as QuerySnapshot).docs.length
//             itemBuilder: (context, int index){
//               return
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CoursePage(),
//                           ),
//                         );
//
//                       },
//
//                       onLongPress: () {
//                         PopupMenuButton(
//                           itemBuilder: (context) {
//                             return <PopupMenuItem>[new PopupMenuItem(child: Text('Delete'))];
//                           },
//                         );
//                       },
//
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 343,
//                             height: 194,
//                             color: Colors.red,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'khoaHoc.thoiGian',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 12,
//                                       color: Colors.green),
//                                 ),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Text(
//                                   (snapshot.data! as QuerySnapshot).docs[index]['title'],
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 24,
//                                       color: Colors.black),
//                                 ),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Text(
//                                   (snapshot.data! as QuerySnapshot).docs[index]['desc'],
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14,
//                                       color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                 ],
//               );
//             },
//
//           );
//         },
//       ),
//     );
//   }
// }
