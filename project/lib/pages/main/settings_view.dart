import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'name_view.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _bell = false;

  String key = 'keyNontifications';
  void checkNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _bell = prefs.getBool(key) ?? false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 190,
              width: 343,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/settings.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 343,
              height: 82,
              child: OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: SwitchListTile(
                  title: const Text(
                    'Notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  value: _bell,
                  onChanged: (bool value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      _bell = value;

                      prefs.setBool(key, _bell);
                    });
                  },
                  secondary: const Icon(
                    FontAwesomeIcons.solidBell,
                    color: Colors.blue,
                  ),
                  activeColor: Colors.greenAccent,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 343,
              height: 21,
              child: Text(
                'Account information',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 343,
              height: 82,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NameView()));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text('Juana Antonieta'),
                  leading: Icon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.blue,
                  ),
                  trailing: Icon(
                    Icons.navigate_next_sharp,
                    size: 45,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 343,
              height: 82,
              child: OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0))),
                ),
                child: ListTile(
                  title: const Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text('juanita123@gmail.com'),
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  trailing: Icon(
                    Icons.navigate_next_sharp,
                    size: 45,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 343,
              height: 82,
              child: OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0))),
                ),
                child: ListTile(
                  title: const Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text('changed 2 weeks ago'),
                  leading: Icon(
                    FontAwesomeIcons.lock,
                    color: Colors.blue,
                  ),
                  trailing: Icon(
                    Icons.navigate_next_sharp,
                    size: 45,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
