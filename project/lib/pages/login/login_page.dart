import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:status_alert/status_alert.dart';

import '../main/home_view.dart';
import 'phone_number_login.dart';
import '../../authentication/authentication.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Signin with email and password
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  late String _email, _password;

  //Sign in with google
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  //Sign in with guest
  final AuthService _auth = AuthService();

  //end sign in with guest

  //Password obscure
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  //Rounded reloading button
  final RoundedLoadingButtonController _signinBtn =
      RoundedLoadingButtonController();

  void _doSignin(RoundedLoadingButtonController controller) async {
    Timer(
      Duration(seconds: 3),
      () async {
        if (_emailKey.currentState!.validate() &&
            _passwordKey.currentState!.validate()) {
          try {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password)
                .then((value) {
              _emailKey.currentState?.reset();
              _passwordKey.currentState?.reset();
              controller.success();
              StatusAlert.show(
                context,
                duration: Duration(seconds: 4),
                title: 'Login success',
                configuration: IconConfiguration(icon: Icons.done),
              );
              Timer(
                Duration(seconds: 4),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                },
              );
            },);
          } on FirebaseAuthException catch (e) {
            controller.error();
            StatusAlert.show(
              context,
              duration: Duration(seconds: 4),
              title: 'Error login',
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
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Kiểm tra xem có bị lỗi khi initialize không
        if (snapshot.hasError) {
          return Text('Something went wrong');
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }

        // Nếu thành công thì hiển thị như lúc đầu chúng ta đã tạo
        if (snapshot.connectionState == ConnectionState.done) {
          // _auth = FirebaseAuth.instance;
          //_googleSignIn = GoogleSignIn();
          // _checkLogin();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 343,
                          height: 253,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/login.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Log in',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Login with social networks',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.facebookSquare,
                                    color: Colors.blue.shade300,
                                    size: 40,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.instagramSquare,
                                    color: Colors.blue.shade300,
                                    size: 40,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.blue.shade300,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    _auth.googleLogin();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            key: _emailKey,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0),
                                ),
                              ),
                              labelText: 'Email',
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
                              prefixIcon: Icon(Icons.password),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0),
                                ),
                              ),
                              labelText: 'Password',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () => null,
                                child: Text('Forgot password'),
                              ),

                              //Sign in with guest
                              TextButton(
                                onPressed: () async {
                                  try {
                                    dynamic result =
                                        await _auth.signInWithGuest();
                                    if (result == null) {
                                      print('error signin');
                                    } else {
                                      print('Login success!');
                                      print(result);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeView(),
                                        ),
                                      );
                                    }
                                  } on FirebaseAuthException catch (e) {

                                  }
                                },
                                child: Text('Login with guest'),
                              ),
                            ],
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
                                    onPressed: () => _doSignin(_signinBtn),
                                    controller: _signinBtn,
                                    child: Text('LOGIN'),
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
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PhoneNumberLogin(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login with phone number',
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
                      // AlertDialog(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        // Đang load
        return CircularProgressIndicator();
      },
    );
  }
}
