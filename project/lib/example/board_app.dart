// import 'CustomCard.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'CustomCard.dart';
//
// class courseApp extends StatefulWidget {
//   @override
//   _courseAppState createState() => _courseAppState();
// }
//
// class _courseAppState extends State<courseApp> {
//   var firestoreDb = FirebaseFirestore.instance.collection("course").snapshots();
//   late TextEditingController nameInputController;
//   late TextEditingController titleInputController;
//   late TextEditingController descriptionInputController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     nameInputController = new TextEditingController();
//     titleInputController = new TextEditingController();
//     descriptionInputController = new TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Community course"),
//       ),
//       body: StreamBuilder(
//         stream: firestoreDb,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return CircularProgressIndicator();
//           return ListView.builder(
//               itemCount: (snapshot.data! as QuerySnapshot).docs.length,
//               itemBuilder: (context, int index) {
//                 return CustomCard(snapshot: snapshot.data! as QuerySnapshot,index:index);
//                 // return Text(snapshot.data.documents[index]['description']);
//               });
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showDialog(context);
//         },
//         child: Icon(Icons.add_outlined),
//       ),
//     );
//   }
//
//   _showDialog(BuildContext context) async {
//     await showDialog(
//         builder: (context) => AlertDialog(
//               contentPadding: EdgeInsets.all(10),
//               content: Column(
//                 children: [
//                   Text("Please fill out the form"),
//                   Expanded(
//                       child: TextField(
//                     autofocus: true,
//                     autocorrect: true,
//                     decoration: InputDecoration(labelText: "Your Name*"),
//                     controller: nameInputController,
//                   )),
//                   Expanded(
//                       child: TextField(
//                     autofocus: true,
//                     autocorrect: true,
//                     decoration: InputDecoration(labelText: "Title*"),
//                     controller: titleInputController,
//                   )),
//                   Expanded(
//                       child: TextField(
//                     autofocus: true,
//                     autocorrect: true,
//                     decoration: InputDecoration(labelText: "Description*"),
//                     controller: descriptionInputController,
//                   ))
//                 ],
//               ),
//           actions: [
//             FlatButton(
//               onPressed: (){
//                   nameInputController.clear();
//                   titleInputController.clear();
//                   descriptionInputController.clear();
//                   Navigator.pop(context);
//               },
//               child: Text("Cancel"),
//             ),
//             FlatButton(onPressed: (){
//               if(titleInputController.text.isNotEmpty && nameInputController.text.isNotEmpty && descriptionInputController.text.isNotEmpty){
//                 FirebaseFirestore.instance.collection("course").add({
//                   "name":nameInputController.text,
//                   "title": titleInputController.text,
//                   "description" : descriptionInputController.text,
//                   "timestamp": new DateTime.now()
//                 }).then((response) {
//                   print(response.id);
//                   Navigator.pop(context);
//                   nameInputController.clear();
//                   titleInputController.clear();
//                   descriptionInputController.clear();
//
//                 }).catchError((error) => print(error));
//               }
//             }, child: Text("Save"))
//           ],
//             ),
//         context: context);
//   }
// }
