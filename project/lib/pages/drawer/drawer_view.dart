import 'package:codefactory/pages/drawer/photo%20firebase/add_image.dart';
import 'package:codefactory/pages/drawer/photo/photo_browser_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'photo firebase/photo_firebase.dart';

class DrawerView extends StatelessWidget {
  String? name = FirebaseAuth.instance.currentUser!.displayName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 16,
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow,
                      Colors.deepOrange,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 8,
                          child: ListTile(
                            leading: Icon(Icons.account_circle),
                            title: Text('$name'),
                          )),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Photo browser'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhotoBrowserView(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Photo firebase'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhotoFirebase(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
