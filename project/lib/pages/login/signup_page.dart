import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codefactory/pages/login/phone_number_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:status_alert/status_alert.dart';

import '../../pages/login/login_page.dart';
import 'package:flutter/material.dart';
import '../../authentication/authentication.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  late String _email, _password, _name, _phone;

  final _auth = FirebaseAuth.instance;

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  AuthService _authService = AuthService();

  //Rounded reloading button
  final RoundedLoadingButtonController _signupBtn =
      RoundedLoadingButtonController();

  void _doSignup(RoundedLoadingButtonController controller) async {
    Timer(
      Duration(seconds: 3),
      () async {
        if (_emailKey.currentState!.validate() &&
            _passwordKey.currentState!.validate()) {
          try {
            await _authService
                .signUp(_name, _phone, _email, _password)
                .then((value) {
              _emailKey.currentState?.reset();
              _passwordKey.currentState?.reset();
              controller.success();
              StatusAlert.show(
                context,
                duration: Duration(seconds: 4),
                title: 'Signup success',
                configuration: IconConfiguration(icon: Icons.done),
              );
              Timer(
                Duration(seconds: 4),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              );
            });
          } on FirebaseAuthException catch (e) {
            controller.error();
            StatusAlert.show(
              context,
              duration: Duration(seconds: 4),
              title: 'Error signup',
              configuration: IconConfiguration(icon: Icons.close),
            );
            print(e.toString());
          }
        }
      },
    );

    Timer(
      Duration(seconds: 6),
      () {
        controller.reset();
      },
    );
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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/signin.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  width: 343,
                  height: 253,
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Create your account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0),
                          ),
                        ),
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _name = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0),
                          ),
                        ),
                        labelText: 'Phone',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _phone = value.trim();
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      key: _emailKey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0),
                          ),
                        ),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value ?? '');
                        if (!emailValid) return 'Invalid email';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      key: _passwordKey,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0),
                          ),
                        ),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: TextButton(
                            onPressed: _toggle,
                            child: Icon(_obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                      validator: (value) {
                        if (value!.length < 6) return 'Invalid password';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneNumberRegister(),
                          ),
                        );
                      },
                      child: Text(
                        'Phone number sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 56,
                            child: RoundedLoadingButton(
                              controller: _signupBtn,
                              onPressed: () => _doSignup(_signupBtn),
                              child: Text('Signup'),
                              borderRadius: 16,
                              elevation: 8,
                              successColor: Colors.blue,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Aready have an account? Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
