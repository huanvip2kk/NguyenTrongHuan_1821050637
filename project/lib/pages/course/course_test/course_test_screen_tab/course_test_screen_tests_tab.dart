

import '../../../success_view.dart';
import 'tests_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestsStack{
  String quiz = '';
  String title = '';
  String description = '';

  TestsStack(
      this.quiz,
      this.title,
      this.description,
      );
}
class CourseTestScreenTestsTab extends StatelessWidget {
  final items = List<TestsStack>.generate(
    1,
        (i) => TestsStack('Quiz ${i+1}', 'Title $i', 'Description $i'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return
            // TestsModel(
            //   itemsStack: this.items[index],
            // );
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          width: 343,
                          height: 197,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //itemsStack.quiz,
                              'Quiz 1',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              height: 8,
                            ),
                            Text(
                              //itemsStack.title,
                              'Header',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              height: 8,
                            ),
                            Text(
                              //itemsStack.description,
                              'Decription',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SuccessView(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              side: BorderSide(width: 2, color: Colors.deepOrange),
                            ),
                            child: Text(
                              'Begin',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
      ),

    );
  }
}