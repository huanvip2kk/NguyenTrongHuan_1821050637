import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefactory/pages/course/course_list_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:status_alert/status_alert.dart';

class CourseAdd extends StatefulWidget {
  @override
  _CourseAddState createState() => _CourseAddState();
}

class _CourseAddState extends State<CourseAdd> {
  final _formKey = GlobalKey<FormState>();
  final _titleKey = GlobalKey<FormFieldState>();
  final _descKey = GlobalKey<FormFieldState>();

  // CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('course');

  final RoundedLoadingButtonController _addBtn =
      RoundedLoadingButtonController();

  late TextEditingController titleInputController;
  late TextEditingController descriptionInputController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleInputController = new TextEditingController();
    descriptionInputController = new TextEditingController();
  }

  String? imageUrl;

  void _showPicker() {
    final _picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(FontAwesomeIcons.fileImage),
                title: Text('Gallery'),
                onTap: () async {
                  final image =
                      await _picker.getImage(source: ImageSource.gallery);
                  File file = File(image!.path);
                  //Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text('Camera'),
                onTap: () async {
                  final image =
                      await _picker.getImage(source: ImageSource.camera);
                  File file = File(image!.path);
                  //Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future uploadImage() async {
    final _picker = ImagePicker();
    PickedFile _image;

    final _storage = FirebaseStorage.instance;

    final image =
    await _picker.getImage(source: ImageSource.gallery);
    File file = File(image!.path);

    if (image != null) {
      //Upload to firebase
      final snapshot = await _storage
          .ref()
          .child('uploadImages/images')
          .putFile(file)
          .whenComplete(() => null);

      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(
        () {
          imageUrl = downloadUrl;
        },
      );
    }
    //Check permissons
    // await Permission.photo.request();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        elevation: 16,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add new course',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                // IconButton(
                //   onPressed: () {
                //     _showPicker();
                //   },
                //   icon: Icon(
                //     FontAwesomeIcons.cameraRetro,
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: titleInputController,
              key: _titleKey,
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
              controller: descriptionInputController,
              key: _descKey,
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
                    FirebaseFirestore.instance.collection("course").add({
                      "title": titleInputController.text,
                      "desc": descriptionInputController.text,
                      "timestamp": new DateTime.now()
                    }).then((response) {
                      print(response.id);
                      Navigator.pop(context);
                      titleInputController.clear();
                      descriptionInputController.clear();
                    }).catchError((error) => print(error));

                    Navigator.of(context).pop();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             CourseListPage(imgUrl: imageUrl)));

                    StatusAlert.show(
                      context,
                      duration: Duration(seconds: 3),
                      title: 'Add course success',
                      configuration: IconConfiguration(icon: Icons.done),
                    );
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
