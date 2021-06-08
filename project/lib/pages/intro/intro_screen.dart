// import 'dart:async';
//
// import '../../pages/login/login_page.dart';
// import 'package:flutter/material.dart';
//
// class GettingStartedScreen extends StatefulWidget {
//   @override
//   _GettingStartedScreenState createState() => _GettingStartedScreenState();
// }
//
// class _GettingStartedScreenState extends State<GettingStartedScreen> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController(initialPage: 0);
//
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (_currentPage < 2) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//
//       _pageController.animateToPage(
//         _currentPage,
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeIn,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }
//
//   _onPageChanged(int index) {
//     setState(() {
//       _currentPage = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => LoginPage(),
//                 ),
//               );
//             },
//             child: Text(
//               'Skip',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14.0,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   children: <Widget>[
//                     PageView.builder(
//                       scrollDirection: Axis.horizontal,
//                       controller: _pageController,
//                       onPageChanged: _onPageChanged,
//                       itemCount: slideList.length,
//                       itemBuilder: (ctx, i) => SlideItem(i),
//                     ),
//                     Stack(
//                       alignment: AlignmentDirectional.topStart,
//                       children: <Widget>[
//                         Container(
//                           margin: const EdgeInsets.only(bottom: 60),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               for (int i = 0; i < slideList.length; i++)
//                                 if (i == _currentPage)
//                                   SlideDots(true)
//                                 else
//                                   SlideDots(false)
//                             ],
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 width: 311,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     FlatButton(
//                       child: Text(
//                         'Next',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       padding: const EdgeInsets.all(16),
//                       color: Theme.of(context).primaryColor,
//                       textColor: Colors.white,
//                       onPressed: () {
//                         //Navigator.of(context).pushNamed(SignupScreen.routeName);
//                       },
//                     ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.center,
//                     //   children: <Widget>[
//                     //     Text(
//                     //       'Have an account?',
//                     //       style: TextStyle(
//                     //         fontSize: 18,
//                     //       ),
//                     //     ),
//                     //     FlatButton(
//                     //       child: Text(
//                     //         'Login',
//                     //         style: TextStyle(fontSize: 18),
//                     //       ),
//                     //       onPressed: () {
//                     //         //Navigator.of(context).pushNamed(LoginScreen.routeName);
//                     //       },
//                     //     ),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SlideDots extends StatelessWidget {
//   bool isActive;
//
//   SlideDots(this.isActive);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       height: isActive ? 6 : 2,
//       width: isActive ? 16 : 8,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.lightBlue : Colors.grey,
//         borderRadius: BorderRadius.all(
//           Radius.circular(4),
//         ),
//       ),
//     );
//   }
// }
//
// class SlideItem extends StatelessWidget {
//   final int index;
//
//   SlideItem(this.index);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         //Hinh anh
//         Container(
//           width: 375,
//           height: 264,
//           decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             image: DecorationImage(
//               image: AssetImage(slideList[index].imageUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 40,
//         ),
//         Text(
//           slideList[index].title,
//           style: TextStyle(
//             fontSize: 22,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           slideList[index].description,
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
//
// class Slide {
//   final String imageUrl;
//   final String title;
//   final String description;
//
//   Slide({
//     required this.imageUrl,
//     required this.title,
//     required this.description,
//   });
// }
//
// final slideList = [
//   Slide(
//     imageUrl: 'assets/images/intro1.png',
//     title: 'Learn anytime and anywhere',
//     description:
//         'Quarantine is the perfect time to spend your day learning something new, from anywhere!',
//   ),
//   Slide(
//     imageUrl: 'assets/images/intro2.png',
//     title: 'Find a course for you',
//     description:
//         'Quarantine is the perfect time to spend your day learning something new, from anywhere!',
//   ),
//   Slide(
//     imageUrl: 'assets/images/intro3.png',
//     title: 'Improve your skills',
//     description:
//         'Quarantine is the perfect time to spend your day learning something new, from anywhere!',
//   ),
// ];

import 'package:codefactory/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  /// When tutorial is done.
  void onDonePress() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
    );
  }

  void onSkipPress() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    slides.clear();

    slides.add(
      new Slide(
        title: ('Learn anytime and anywhere'),
        styleTitle: (TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
        description:
            ('Quarantine is the perfect time to spend your day learning something new, from anywhere!'),
        styleDescription: (TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.bold)),
        marginDescription: EdgeInsets.only(top: 30, left: 20, right: 20),
        pathImage: 'assets/images/intro1.png',
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: ('Find a course for you'),
        styleTitle: (TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
        description:
            ('Quarantine is the perfect time to spend your day learning something new, from anywhere!'),
        styleDescription: (TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey)),
        marginDescription: EdgeInsets.only(top: 30, left: 20, right: 20),
        pathImage: 'assets/images/intro2.png',
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: ('Improve your skills'),
        styleTitle: (TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
        description:
            ('Quarantine is the perfect time to spend your day learning something new, from anywhere!'),
        styleDescription: (TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey)),
        marginDescription: EdgeInsets.only(top: 30, left: 20, right: 20),
        pathImage: 'assets/images/intro3.png',
        backgroundColor: Colors.white,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: IntroSlider(

          showSkipBtn: true,
          showPrevBtn: true,
          slides: this.slides,
          onDonePress: this.onDonePress,
          onSkipPress: this.onSkipPress,
          nameNextBtn: ('Next'),
          nameDoneBtn: ('Let\'s start'),
          nameSkipBtn: ('Skip'),
          colorSkipBtn: Colors.grey,
          colorDoneBtn: Colors.deepOrange,
          colorDot: Colors.grey,
          colorPrevBtn: Colors.deepOrange,
          colorActiveDot: Colors.blue,
          // widthDoneBtn: buttonWidth,
          isScrollable: true,

        ),
      ),
    );
  }
}
