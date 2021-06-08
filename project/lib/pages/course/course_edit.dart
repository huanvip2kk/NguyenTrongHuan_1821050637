import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefactory/pages/course/course_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:status_alert/status_alert.dart';

class CourseEdit extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CourseEdit({Key? key, required this.snapshot, required this.index})
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
              'Edit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.edit),
            onTap: () async {
              await showDialog(
                  builder: (context) => AlertDialog(
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Edit ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                snapshotData['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.deepOrange),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: titleInputController,
                                decoration: InputDecoration(
                                  labelText: 'Title',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value != null && value.length > 0) {
                                    return null;
                                  }
                                  return 'Title annot empty!';
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: descriptionInputController,
                                decoration: InputDecoration(
                                  labelText: 'Desciption',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value != null && value.length > 0) {
                                    return null;
                                  }
                                  return 'Desciption cannot empty!';
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              titleInputController.clear();
                              descriptionInputController.clear();
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FirebaseFirestore.instance
                                    .collection("course")
                                    .doc(docId)
                                    .update({
                                  "title": titleInputController.text,
                                  "desc": descriptionInputController.text,
                                  "timestamp": new DateTime.now()
                                }).then((value) {
                                  Navigator.pop(context);
                                  StatusAlert.show(
                                    context,
                                    duration: Duration(seconds: 3),
                                    title: 'Edit success',
                                    configuration:
                                        IconConfiguration(icon: Icons.done),
                                  );
                                });
                              }
                            },
                            child: Text("Update"),
                          ),
                        ],
                      ),
                  context: context);
            },
          ),
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
                                  .collection("course");
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
