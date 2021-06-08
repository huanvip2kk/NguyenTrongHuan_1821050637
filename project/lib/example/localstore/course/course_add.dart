// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class CourseEdit extends StatelessWidget {
//   TextEditingController courseText = TextEditingController();
//   TextEditingController decriptionText = TextEditingController();
//
//   CollectionReference collectionReference =
//       FirebaseFirestore.instance.collection('course');
//
//   final _courseKey = GlobalKey<FormFieldState>();
//   final _decriptionKey = GlobalKey<FormFieldState>();
//
//   Future<void> addCourse() {
//     // Call the user's CollectionReference to add a new user
//     return collectionReference
//         .add({
//           'Course': courseText.text,
//           'Decription': decriptionText.text,
//         })
//         .then((value) => print("Course added"))
//         .catchError((error) => print("Failed to add course: $error"));
//   }
//
//   // Future<void> updateCourse() {
//   //   return collectionReference
//   //       .doc('avoOkgOTBFLUvuGMH9j3')
//   //       .update({
//   //     'Course': courseText.text,
//   //     'Decription': decriptionText.text,
//   //   })
//   //       .then((value) => print("Course Updated"))
//   //       .catchError((error) => print("Failed to update course: $error"));
//   // }
//   //
//   // Future<void> deleteCourse() {
//   //   return collectionReference
//   //       .doc('avoOkgOTBFLUvuGMH9j3')
//   //       .delete()
//   //       .then((value) => print("Course Property Deleted"))
//   //       .catchError(
//   //           (error) => print("Failed to delete course property: $error"));
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     void _showSnackBar(String text) {
//       final snackBar = SnackBar(
//         duration: Duration(milliseconds: 2000),
//         backgroundColor:
//             // ans.compareTo("Yes") == 0 ? Colors.lightGreenAccent : Colors.yellow,
//             Colors.deepOrange,
//         content: Row(
//           children: [
//             Icon(
//               // ans.compareTo("Yes") == 0 ? Icons.favorite : Icons.watch,
//               // color: ans.compareTo("Yes") == 0 ? Colors.pink : Colors.yellow,
//               Icons.error_outline,
//
//               size: 24,
//               semanticLabel: text,
//             ),
//             Text(text),
//           ],
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//
//     Future<void> _alertDialog() async {
//       void _datePickerDialog() {
//         DateTime now = DateTime.now();
//         showDatePicker(
//                 context: context,
//                 initialDate: now,
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2050))
//             .then((onValue) {
//           _showSnackBar('$onValue');
//         });
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(),
//             ),
//             child: Icon(
//               Icons.navigate_before,
//               color: Colors.deepOrange,
//             ),
//             width: 48,
//             height: 48,
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         title: Text(
//           "Add the course",
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//             fontSize: 24,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               key: _courseKey,
//               controller: courseText,
//               decoration: InputDecoration(
//                 border: new OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(
//                     const Radius.circular(12.0),
//                   ),
//                 ),
//                 labelText: 'Course',
//               ),
//               validator: (value) {
//                 if (value!.length < 3) return 'Invalid course';
//                 return null;
//               },
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             TextFormField(
//               key: _decriptionKey,
//               controller: decriptionText,
//               decoration: InputDecoration(
//                 border: new OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(
//                     const Radius.circular(12.0),
//                   ),
//                 ),
//                 labelText: 'Decription',
//               ),
//               validator: (value) {
//                 if (value!.length < 3) return 'Invalid course';
//                 return null;
//               },
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             // SizedBox(
//             //   height: 56,
//             //   child: ElevatedButton(
//             //     onPressed: ()
//             //     {
//             //       _alertDialog();
//             //     },
//             //     child: Text('Date picker'),
//             //     style: ButtonStyle(
//             //       shape:
//             //       MaterialStateProperty.all<RoundedRectangleBorder>(
//             //         RoundedRectangleBorder(
//             //           borderRadius: BorderRadius.circular(18.0),
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             SizedBox(
//               width: double.infinity,
//               height: 56,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_courseKey.currentState!.validate() &&
//                       _decriptionKey.currentState!.validate()) {
//                     addCourse();
//                     _showSnackBar(' Success!');
//                   }
//                 },
//                 child: Text('Add course'),
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:status_alert/status_alert.dart';


class CourseEdit extends StatefulWidget {
  final CourseModel? course;

  CourseEdit({
    Key? key,
    this.course,
  }) : super(key: key);

  @override
  _CourseEditState createState() => _CourseEditState();
}

class _CourseEditState extends State<CourseEdit> {
  TextEditingController titleText = TextEditingController();
  TextEditingController decriptionText = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _titleKey = GlobalKey<FormFieldState>();
  final _descKey = GlobalKey<FormFieldState>();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('course');

  // Future<void> addCourse() {
  //   final db = FirebaseFirestore.instance;
  //   String id;
  //   id ??= db.collection('course').doc().id;
  //   return db.collection('course').doc(id).set(toMap());
  // }

  // Future<void> updateCourse() {
  //   return collectionReference
  //       .doc('avoOkgOTBFLUvuGMH9j3')
  //       .update({
  //         'Course': titleText.text,
  //         'Decription': decriptionText.text,
  //       })
  //       .then((value) => print("Course Updated"))
  //       .catchError((error) => print("Failed to update course: $error"));
  // }
  //
  // Future<void> deleteCourse() {
  //   return collectionReference
  //       .doc('avoOkgOTBFLUvuGMH9j3')
  //       .delete()
  //       .then((value) => print("Course Property Deleted"))
  //       .catchError(
  //           (error) => print("Failed to delete course property: $error"));
  // }
  //
  final RoundedLoadingButtonController _addBtn =
      RoundedLoadingButtonController();

  //
  // void _doAdd(RoundedLoadingButtonController controller) async {
  //   Timer(
  //     Duration(seconds: 2),
  //     () async {
  //
  //       if (_formKey.currentState!.validate()) {
  //         try {
  //           await FirebaseFirestore.instance.save().then((value) {
  //             _formKey.currentState?.reset();
  //             controller.success();
  //             StatusAlert.show(
  //               context,
  //               duration: Duration(seconds: 3),
  //               title: 'Add course success',
  //               configuration: IconConfiguration(icon: Icons.done),
  //             );
  //             // Timer(
  //             //   Duration(seconds: 4),
  //             //       () {
  //             //     Navigator.push(
  //             //       context,
  //             //       MaterialPageRoute(
  //             //         builder: (context) => HomeView(),
  //             //       ),
  //             //     );
  //             //   },
  //             // );
  //           });
  //         } on FirebaseAuthException catch (e) {
  //           controller.error();
  //           StatusAlert.show(
  //             context,
  //             duration: Duration(seconds: 4),
  //             title: 'Network error',
  //             configuration: IconConfiguration(icon: Icons.close),
  //
  //           );
  //           print(e.toString());
  //         }
  //       }
  //     },
  //
  //
  //   );
  //
  //
  //
  //   Timer(
  //     Duration(seconds: 4),
  //     () {
  //       controller.reset();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var course = widget.course;
    return Form(
      key: _formKey,
      child: AlertDialog(
        elevation: 16,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            course == null
                ? Text(
                    'Add new course',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                : Text(
                    'Edit course',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              key: _titleKey,
              initialValue: course?.title,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value != null && value.length > 0) {
                  return null;
                }
                return 'Cannot empty!';
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              key: _descKey,
              initialValue: course?.desc,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value != null && value.length > 0) {
                  return null;
                }
                return 'Cannot empty!';
              },
            ),
            SizedBox(
              height: 16,
            ),
            RoundedLoadingButton(
              controller: _addBtn,
              // onPressed:() => {_doAdd(_addBtn)},
              onPressed: () async {
                Timer(Duration(seconds: 3), () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      if (course == null) {
                        course = CourseModel(
                          title: _titleKey.currentState!.value,
                          desc: _descKey.currentState!.value,
                        );
                      } else {
                        course?.title = _titleKey.currentState!.value;
                        course?.desc = _descKey.currentState!.value;
                      }
                      course?.save();
                      Navigator.of(context).pop();
                      StatusAlert.show(
                        context,
                        duration: Duration(seconds: 3),
                        title: 'Add course success',
                        configuration: IconConfiguration(icon: Icons.done),
                      );
                    } catch (e) {
                      _addBtn.error();
                      StatusAlert.show(
                        context,
                        duration: Duration(seconds: 4),
                        title: 'Network error',
                        configuration: IconConfiguration(icon: Icons.close),
                      );
                    }
                  }
                });
                Timer(
                  Duration(seconds: 4),
                  () {
                    _addBtn.reset();
                  },
                );
              },
              child: Text('Add course'),
              borderRadius: 16,
              elevation: 8,
              successColor: Colors.blue,
              color: Colors.deepOrange,
            )
          ],
        ),
      ),
    );
  }
}
