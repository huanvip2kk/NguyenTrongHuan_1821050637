
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'pages/course/course_list_page.dart';
import 'pages/intro/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Code Factory',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          fontFamily: 'Rubik',
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        ),
        home: SplashScreen(),
    );
  }
}
