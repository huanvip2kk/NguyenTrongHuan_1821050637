import 'package:codefactory/example/localstore/course/course_list_page.dart';
import 'package:codefactory/pages/course/course_list_page.dart';

import '../drawer/drawer_view.dart';

import '../../pages/login/signup_page.dart';
import '../../pages/main/course_view.dart';
import '../../pages/main/profile_view.dart';
import '../../pages/main/settings_view.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 1;
  Widget _SettingsViewState = SettingsView();
  Widget _ProfileState = ProfileView();

  final tabs = [
    CourseListPage(),
    ProfileView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerView(),
      body: tabs[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                title: Text('Course'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_applications),
                title: Text('Settings'),
              ),
            ],
            onTap: (int index) {
              this.setState(() {
                this._selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
