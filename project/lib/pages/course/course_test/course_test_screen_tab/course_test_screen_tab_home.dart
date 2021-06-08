import 'package:codefactory/pages/success_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'course_test_screen_lessons_tab.dart';
import 'course_test_screen_tests_tab.dart';

class CourseTestScreenTabHome extends StatefulWidget {
  @override
  _CourseTestScreenTabHomeState createState() =>
      _CourseTestScreenTabHomeState();
}

class _CourseTestScreenTabHomeState extends State<CourseTestScreenTabHome> {
  final _tabsTieuDe = [
    Tab(
      child: Text(
        'Lessons',
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ),
    Tab(
      child: Text(
        'Tests',
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ),
    Tab(
      child: Text(
        'Discuss',
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ),
  ];

  final _tabsPages = [
    CourseTestScreenLessonsTab(),
    CourseTestScreenTestsTab(),
    Tab(
      text: 'Discuss',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            "HTML",
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
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Tags For Headers',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '3 of 11 lessons',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    TabBar(
                      tabs: _tabsTieuDe,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(child: TabBarView(children: _tabsPages),width: double.infinity,height: 600,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //TabBarView(children: _tabsPages),
      ),
    );
  }
}
