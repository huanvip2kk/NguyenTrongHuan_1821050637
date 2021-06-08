import 'package:codefactory/models/question_model.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  //Animation progress bar
  late AnimationController _animationController;
  late Animation _animation;

  //Can access animation outside
  Animation get animation => this._animation;

  // List<Question> _questions = question_data
  //     .map((question) => Question(
  //           id: question['id'],
  //           question: question['question'],
  //           options: question['option'],
  //           answer: question['answer_index'],
  //         ))
  //     .toList();
  //
  // List<Question> get questions => this._questions;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60  s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    _animationController.forward();
    // Once 60s is completed go to the next qn
    //   _animationController.forward().whenComplete(nextQuestion);
    //   _pageController = PageController();
    super.onInit();
    // }
  }
}
