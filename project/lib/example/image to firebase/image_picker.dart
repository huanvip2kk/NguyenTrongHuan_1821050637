

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerFirebase extends StatefulWidget {
  @override
  _ImagePickerFirebaseState createState() => _ImagePickerFirebaseState();
}

class _ImagePickerFirebaseState extends State<ImagePickerFirebase> {
  PickedFile? _image;

  String? imageUrl;

  Future _getImageFromCamera() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = PickedFile(image!.path);
    });
  }

  Future _getImageFromGallery() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = PickedFile(image!.path);
    });
  }

  void _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.galacticRepublic),
                  title: Text('Gallery'),
                  onTap: () {
                    uploadImage();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt_outlined),
                  title: Text('Camera'),
                  onTap: () {
                    _getImageFromCamera();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        }
    );
  }

  Future uploadImage() async{
    final _picker = ImagePicker();
    PickedFile _image;

    final _storage = FirebaseStorage.instance;

    final image = await _picker.getImage(source: ImageSource.gallery);
    File file = File(image!.path);

    if(image != null){
      //Upload to firebase
      final snapshot = await _storage.ref()
          .child('uploadImages/images')
          .putFile(file)
          .whenComplete(() => null);

      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });
    }
    //Check permissons
    // await Permission.photo.request();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image picker'),
      ),
      body: Center(
        child:
           //_image == null ? Text('Empty') : Image.file(File(_image!.path)),
        (imageUrl != null)
            ? Image.network(imageUrl!)
            : Container(
          margin: EdgeInsets.all(16),
          width: double.infinity,
          height: 500,
          color: Colors.red,
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showPicker();
        },
        tooltip: 'Image picker',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

