// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:localstore/localstore.dart';
//
// class CourseModel {
//   String? id;
//   String title;
//   String desc;
//   CourseModel({
//     this.id,
//     required this.title,
//     required this.desc,
//   });
//
//   CourseModel copyWith({
//     String? id,
//     String? title,
//     String? desc,
//   }) {
//     return CourseModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       desc: desc ?? this.desc,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'desc': desc,
//     };
//   }
//
//   factory CourseModel.fromMap(Map<String, dynamic> map) {
//     return CourseModel(
//       id: map['id'],
//       title: map['title'],
//       desc: map['desc'],
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory CourseModel.fromJson(String source) => CourseModel.fromMap(json.decode(source));
//
//   @override
//   String toString() => 'CourseModel(id: $id, title: $title, desc: $desc)';
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//
//     return other is CourseModel &&
//         other.id == id &&
//         other.title == title &&
//         other.desc == desc;
//   }
//
//   @override
//   int get hashCode => id.hashCode ^ title.hashCode ^ desc.hashCode;
// }
//
// extension ExtCourse on CourseModel {
//   Future save() async {
//     final db = FirebaseFirestore.instance;
//     id ??= db.collection('course').doc().id;
//     return db.collection('course').doc(id).set(toMap());
//   }
//
//   // Future delete() async {
//   //   final db = FirebaseFirestore.instance;
//   //   return db.collection('course').doc(id).delete();
//   // }
//
//
//
//   Future<void> delete() {
//     CollectionReference course = FirebaseFirestore.instance.collection('course');
//     return course
//         .doc(id)
//         .delete()
//         .then((value) => print("Deleted"))
//         .catchError((error) => print("Failed to delete: $error"));
//   }
// }
//
