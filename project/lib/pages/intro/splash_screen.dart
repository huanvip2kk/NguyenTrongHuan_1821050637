import 'dart:async';

import 'package:flutter/material.dart';

import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => IntroScreen(),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          width: 375,
          height: 326,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash_screen.png',
                width: 375,
                height: 246,
                fit: BoxFit.cover,),
              SizedBox(
                height: 16,
              ),
              Text(
                'CodeFactory',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
