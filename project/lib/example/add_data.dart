// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:codefactory/add_data/all_data.dart';
// import 'package:flutter/material.dart';

// class AddData extends StatefulWidget {
//   @override
//   _AddDataState createState() => _AddDataState();
// }

// class _AddDataState extends State<AddData> {
//   CollectionReference users = FirebaseFirestore.instance.collection('tbl_user');

//   Future<void> addUser() {
//     // Call the user's CollectionReference to add a new user
//     return users
//         .add({
//           'username': username.text,
//           'password': password.text,
//         })
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }

//   Future<void> updateUser() {
//     return users
//         .doc('avoOkgOTBFLUvuGMH9j3')
//         .update({
//           'username': username.text,
//           'password': password.text,
//         })
//         .then((value) => print("User Updated"))
//         .catchError((error) => print("Failed to update user: $error"));
//   }

//   Future<void> deleteUser() {
//     return users
//         .doc('avoOkgOTBFLUvuGMH9j3')
//         .delete()
//         .then((value) => print("User's Property Deleted"))
//         .catchError(
//             (error) => print("Failed to delete user's property: $error"));
//   }

//   final _formKey = GlobalKey<FormState>();

//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add data firestore"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Column(
//                 children: [
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: username,
//                           decoration: InputDecoration(
//                             border: new OutlineInputBorder(
//                               borderRadius: const BorderRadius.all(
//                                 const Radius.circular(12.0),
//                               ),
//                             ),
//                             labelText: 'User name',
//                           ),
//                           // onChanged: (value) {
//                           //   setState(() {
//                           //     _email = value.trim();
//                           //   });
//                           // },
//                         ),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         TextFormField(
//                           controller: password,
//                           decoration: InputDecoration(
//                             border: new OutlineInputBorder(
//                               borderRadius: const BorderRadius.all(
//                                 const Radius.circular(12.0),
//                               ),
//                             ),
//                             labelText: 'Password',
//                           ),
//                           // onChanged: (value) {
//                           //   setState(() {
//                           //     _email = value.trim();
//                           //   });
//                           // },
//                         ),
//                         SizedBox(
//                           height: 16,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 56,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         addUser();
//                       },
//                       child: Text('Add data'),
//                       style: ButtonStyle(
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               SizedBox(
//                 height: 56,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => UserInformation(),
//                       ),
//                     );
//                   },
//                   child: Text('Fetch data'),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Column(
//                 children: [
//                   TextFormField(
//                     controller: username,
//                     decoration: InputDecoration(
//                       border: new OutlineInputBorder(
//                         borderRadius: const BorderRadius.all(
//                           const Radius.circular(12.0),
//                         ),
//                       ),
//                       labelText: 'User name',
//                     ),
//                     // onChanged: (value) {
//                     //   setState(() {
//                     //     _email = value.trim();
//                     //   });
//                     // },
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                     controller: password,
//                     decoration: InputDecoration(
//                       border: new OutlineInputBorder(
//                         borderRadius: const BorderRadius.all(
//                           const Radius.circular(12.0),
//                         ),
//                       ),
//                       labelText: 'Password',
//                     ),
//                     // onChanged: (value) {
//                     //   setState(() {
//                     //     _email = value.trim();
//                     //   });
//                     // },
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   SizedBox(
//                     height: 56,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         updateUser();
//                       },
//                       child: Text('Update data'),
//                       style: ButtonStyle(
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               SizedBox(
//                 height: 56,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     deleteUser();
//                   },
//                   child: Text('delete data'),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               // Text(
//               //   data.toString(),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
