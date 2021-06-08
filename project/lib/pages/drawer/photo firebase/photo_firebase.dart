import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefactory/pages/drawer/photo%20firebase/add_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'image_edit.dart';

class PhotoFirebase extends StatefulWidget {
  @override
  _PhotoFirebaseState createState() => _PhotoFirebaseState();
}

class _PhotoFirebaseState extends State<PhotoFirebase> {
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
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Photo firebase storage',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: GridView.builder(
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(4),
                        width: 100,
                        height: 100,
                        child: GestureDetector(
                          onLongPress: () => showDialog(
                            context: context,
                            builder: (context) => ImageEdit(
                                snapshot: snapshot.data! as QuerySnapshot,
                                index: index),
                            barrierDismissible: true,
                          ),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: (snapshot.data! as QuerySnapshot)
                                .docs[index]
                                .get('url'),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(32.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddImage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
