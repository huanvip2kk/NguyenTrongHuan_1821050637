import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'photo.dart';
import 'photo_detail_view.dart';

class PhotoBrowserView extends StatefulWidget {
  final String? tag;

  const PhotoBrowserView({
    Key? key,
    this.tag,
  }) : super(key: key);

  @override
  _PhotoBrowserViewState createState() => _PhotoBrowserViewState();
}

class _PhotoBrowserViewState extends State<PhotoBrowserView> {
  bool _isSearch = false;
  bool _isBusy = false;

  get isBusy => _isBusy;

  set isBusy(value) {
    setState(() {
      _isBusy = value;
    });
  }

  final tagControler = TextEditingController();

  List<Photo> photos = [];

  Future search(String tags, int page) async {
    setState(() {
      photos = [];
    });
    if (tags.isEmpty) {
      return;
    }
    tags = tags.replaceAll(',', '%2C');

    final url = Uri.https(
      'www.flickr.com',
      'services/rest',
      {
        'api_key': '5a9d130758d8c0c27a501e3179ad02f4',
        'tags': '$tags',
        'page': '$page',
        'method': 'flickr.photos.search',
        'format': 'json',
        'nojsoncallback': '1',
      },
    );

    isBusy = true;

    var response = await http.get(url);

    isBusy = false;

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      List p = jsonResponse['photos']['photo'];
      p.forEach(
        (e) => photos.add(
          Photo(
            id: e['id'],
            title: e['title'],
            secret: e['secret'],
            server: e['server'],
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    if (widget.tag != null) {
      setState(
        () {
          search(widget.tag!, 1);
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearch
            ? TextFormField(
                controller: tagControler,
                autofocus: _isSearch,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )
            : Text(
                'Photo browser',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
        centerTitle: true,
        actions: [
          Visibility(
            visible: _isSearch,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(
                  () {
                    _isSearch = false;
                  },
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.deepOrange,
            ),
            onPressed: () {
              setState(
                () {
                  if (_isSearch) {
                    search(tagControler.text, 1);
                  } else {
                    _isSearch = true;
                  }
                },
              );
            },
          ),
        ],
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
      ),
      body: isBusy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : photos.length == 0
              ? Center(
                  child: Text('No result'),
                )
              : GridView.count(
                  padding: EdgeInsets.all(16),
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: photos.map(
                    (e) {
                      return GestureDetector(
                        child: Column(
                          children: [
                            Divider(
                              thickness: 4,
                              color: Colors.grey,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 250,
                                    child: CachedNetworkImage(
                                      imageUrl: e.getUrl('c'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Card(
                                      child: Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Text(
                                            e.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                      elevation: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PhotoDetailView(
                                    id: e.id,
                                    url: e.getUrl('c'),
                                  )));
                        },
                      );
                    },
                  ).toList(),
                ),
    );
  }
}
