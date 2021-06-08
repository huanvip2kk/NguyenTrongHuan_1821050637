import '../course/course_page.dart';
import 'package:flutter/material.dart';

class NameView extends StatelessWidget {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   // leading: IconButton(
      //   //   icon: Container(
      //   //     decoration: BoxDecoration(
      //   //       shape: BoxShape.circle,
      //   //       border: Border.all(),
      //   //     ),
      //   //     child: Icon(
      //   //       Icons.navigate_before,
      //   //       color: Colors.black,
      //   //     ),
      //   //     width: 48,
      //   //     height: 48,
      //   //   ),
      //   //   onPressed: () => Navigator.of(context).pop(),
      //   // ),
      //   // iconTheme: IconThemeData(
      //   //   color: Colors.black, //change your color here
      //   // ),
      //   // title: Text(
      //   //   "Your Course",
      //   //   style: TextStyle(
      //   //     fontWeight: FontWeight.w500,
      //   //     color: Colors.black,
      //   //     fontSize: 24,
      //   //   ),
      //   // ),
      //   // centerTitle: true,
      // ),
      body: Column(
        children: [
          SafeArea(
            minimum: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 375,
                  height: 192,
                  child: Column(
                    children: [
                      Container(
                        width: 343,
                        height: 72,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello,',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Juana Antonieta',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 343,
                        height: 56,
                        child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(12.0),
                              ),
                            ),
                            labelText: 'Search course',
                            suffixIcon: TextButton(
                                onPressed: () {
                                  print(Text(_searchController.text));
                                },
                                child: Icon(Icons.search)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Category: '),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade400,
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: Text(
                                '#CSS',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade400,
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: Text(
                                '#UX',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade400,
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: Text(
                                '#Swift',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade400,
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: Text(
                                '#UI',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: 343,
                child: Column(
                  children: [
                    Container(
                      width: 343,
                      height: 194,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'Left 1h 20 min',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.green),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Text(
                              'Swift',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: Colors.black),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Text(
                              'Advanced IOS apps',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
