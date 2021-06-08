import 'package:codefactory/models/question_model.dart';
import 'package:codefactory/pages/course/course_test/course%20question/question_controller.dart';
import 'package:codefactory/pages/course/course_test/course%20question/view/Question_view.dart';
import 'package:codefactory/pages/course/course_test/course%20question/view/progress_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';

class CourseQuestion extends StatefulWidget {
  @override
  _CourseQuestionState createState() => _CourseQuestionState();
}

class _CourseQuestionState extends State<CourseQuestion> {
  final _db = Localstore.instance;

  final _items = <String, Question>{};

  @override
  void initState() {
    _db.collection('supplier').stream.listen((event) {
      setState(() {
        final item = Question.fromMap(event);
        _items.putIfAbsent(item.id!, () => item);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Progress bar
            ProgressBar(),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1 ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                Text(
                  'of ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                Text(
                  '20',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),

            //Question view
            // Container(
            //   width: double.infinity,
            //   height: 500,
            //   child: DefaultTabController(
            //     length: 3,
            //     child: TabBarView(
            //       children: [QuestionView(), QuestionView(), QuestionView()],
            //     ),
            //   ),
            // ),

            Container(
              width: double.infinity,
              height: 600,
              child: PageView.builder(
                // Block swipe to next qn
                // physics: NeverScrollableScrollPhysics(),
                // controller: _questionController.pageController,
                // onPageChanged: _questionController.updateTheQnNum,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final key = _items.keys.elementAt(index);
                  final item = _items[key]!;
                  return Column(
                    children: [
                      Text(
                        '${item.id}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 191,
                        width: 343,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: Container(
                          child: Column(
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                child: Container(
                                  height: 58,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'ok',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Container(
                                  height: 58,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'B. <p>',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Container(
                                  height: 58,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'C. <h1>',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Container(
                                  height: 58,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'D. <h5>',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              ),
            ),
            // ...List.generate(3, (index) => QuestionView(),),
            //



            //Button
            Container(
              height: 58,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
