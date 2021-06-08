import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'photo.dart';
import 'photo_browser_view.dart';

class PhotoDetailView extends StatefulWidget {
  final String id;
  final String url;

  const PhotoDetailView({
    Key? key,
    required this.id,
    required this.url,
  }) : super(key: key);

  @override
  _PhotoDetailViewState createState() => _PhotoDetailViewState();
}

class _PhotoDetailViewState extends State<PhotoDetailView> {
  List<String> tags = [];

  Future getInfo() async {
    final url = Uri.https(
      'www.flickr.com',
      'services/rest',
      {
        'api_key': '5a9d130758d8c0c27a501e3179ad02f4',
        'photo_id': widget.id,
        'method': 'flickr.photos.getInfo',
        'format': 'json',
        'nojsoncallback': '1',
      },
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      final result = jsonResponse['photo'];
      final _tags = result['tags'];
      final _tag = _tags['tag'];
      
      setState(() {
        tags = List<String>.from(_tag.map((e) => e['_content']));
      });
    }
  }

  @override
  void initState() {
    getInfo();
    super.initState();
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
              border: Border.all(color: Colors.deepOrange),
            ),
            child: Icon(
              Icons.arrow_back_ios_outlined,
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
          "Photo detail",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                    height: 500,
                    width: double.infinity,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.url),
                    )
                    // Image.network(widget.url, fit: BoxFit.cover,),
                    ),

                Wrap(
                  children: tags.map(
                    (e) {

                      // return TextButton(
                      //   child: Text(e),
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //         builder: (context) => PhotoBrowserView(
                      //           tag: e,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                      return Column(
                        children: [
                          // Text(e),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => PhotoBrowserView(
                                    tag: e,
                                  ),
                                ),
                              );
                            },
                            child: Chip(
                              label: Text(e),
                              avatar: CircleAvatar(
                                child: Text(e.substring(0, 1)),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
