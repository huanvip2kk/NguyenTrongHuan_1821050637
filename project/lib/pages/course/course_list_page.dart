import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefactory/models/course_model.dart';
import 'package:codefactory/pages/course/course_edit.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'course_add.dart';
import 'course_page.dart';



class CourseListPage extends StatelessWidget {
  final firestoreDB =
      FirebaseFirestore.instance.collection('course').snapshots();

  // final imgUrl;
  // CourseListPage({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepOrange),
            ),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            width: 48,
            height: 48,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Your Course",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => CourseAdd(),
              barrierDismissible: true,
            ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: firestoreDB,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: (snapshot.data! as QuerySnapshot).docs.length,
            itemBuilder: (context, int index) {
              //Get doc ID
              var docId = (snapshot.data! as QuerySnapshot).docs[index].id;

              var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
                  (snapshot.data! as QuerySnapshot)
                          .docs[index]["timestamp"]
                          .seconds *
                      1000);
              var dateFormatted =
                  new DateFormat('yyyy-MM-dd hh:mm').format(timeToDate);

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoursePage(),
                          ),
                        );
                      },
                      onLongPress: () => showDialog(
                        context: context,
                        builder: (context) => CourseEdit(
                            snapshot: snapshot.data! as QuerySnapshot,
                            index: index),
                        barrierDismissible: true,
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Image firebase
                          // (imgUrl != null)
                          //     ? Image.network(imgUrl!)
                          //     : Container(
                          //         margin: EdgeInsets.all(16),
                          //         width: double.infinity,
                          //         height: 194,
                          //         color: Colors.deepOrange,
                          //       ),
                          Container(
                            margin: EdgeInsets.all(16),
                            width: double.infinity,
                            height: 194,
                            color: Colors.deepOrange,
                          ),
                          //Data firebase
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  dateFormatted,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  (snapshot.data! as QuerySnapshot).docs[index]
                                      ['title'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  (snapshot.data! as QuerySnapshot).docs[index]
                                      ['desc'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
