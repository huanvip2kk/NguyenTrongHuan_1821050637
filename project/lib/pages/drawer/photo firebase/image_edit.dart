import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefactory/pages/course/course_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:status_alert/status_alert.dart';

class ImageEdit extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const ImageEdit({Key? key, required this.snapshot, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _addBtn =
    RoundedLoadingButtonController();

    var docId = snapshot.docs[index].id;
    var snapshotData = snapshot.docs[index].data();

    TextEditingController titleInputController =
    new TextEditingController(text: snapshotData['title']);
    TextEditingController descriptionInputController =
    new TextEditingController(text: snapshotData['desc']);

    // var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
    //     snapshot.docs[index].data["Timestamp"].seconds * 1000);
    // var dateFormatted = new DateFormat("EEEE, MMM d").format(timeToDate);

    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.delete),
            onTap: () async {
              await showDialog(
                  builder: (context) => AlertDialog(
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Are you sure? ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: ()  {
                          var CollectionReference = FirebaseFirestore
                              .instance
                              .collection("imageURLs");
                          CollectionReference.doc(docId).delete();
                          Navigator.of(context).pop();
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  ),
                  context: context);
            },
          ),
        ],
      ),
    );
  }
}
