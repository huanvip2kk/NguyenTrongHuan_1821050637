import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddImage extends StatefulWidget {
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  List<File> _image = [];
  final picker = ImagePicker();
  late firebase_storage.Reference ref;
  late CollectionReference imgRef;
  bool uploading = false;
  double val = 0;

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }

  Future uploadFile() async {
    // int i = 1;
    // setState(() {
    //   val = i / _image.length;
    // });
    for (var img in _image) {
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
          // i++;
        });
      });
    }
  }

  final RoundedLoadingButtonController _uploadBtn =
      RoundedLoadingButtonController();

  void _doUpload() async {
    Timer(Duration(seconds: 2), () {
      _uploadBtn.success();
    });

    Timer(Duration(seconds: 3), () {
      // setState(() {
      //   uploading = true;
      // });
      uploadFile().whenComplete(
        () => Navigator.of(context).pop(),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }

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
              border: Border.all(),
            ),
            child: Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
            width: 48,
            height: 48,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedLoadingButton(
              controller: _uploadBtn,
              onPressed: _doUpload,
              child: Row(
                children: [Text('Upload'), Icon(Icons.arrow_forward_ios)],
              ),
              width: 100,
              color: Colors.deepOrange,
              successColor: Colors.blue,
            ),
          )
        ],
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Add image',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange),
        ),
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: _image.length + 1,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return index == 0
                  ? Center(
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () {
                          !uploading ? chooseImage() : null;
                        },
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                            _image[index - 1],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
            },
          ),
          // uploading
          //     ? Center(
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Container(
          //               child: Text(
          //                 'Uploading...',
          //                 style: TextStyle(fontSize: 20),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             CircularProgressIndicator(
          //               value: val,
          //               valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          //             )
          //           ],
          //         ),
          //       )
          //     : Container()
        ],
      ),
    );
  }
}
