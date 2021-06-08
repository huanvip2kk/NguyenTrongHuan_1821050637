import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late GoogleSignIn _googleSignIn;

  Future googleLogin() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // final User? user = (await _auth.signInWithCredential(credential)).user;
    // print("signed in " + user!.displayName!);
    // setState(
    //   () {
    //     // User đã login thì hiển thị đã login
    //     _message = "You are signed in";
    //   },
    // );
  }

// Future _handleSignOut() async {
//   await _auth.signOut();
//   await _googleSignIn.signOut();
//   setState(
//     () {
//       // Hiển thị thông báo đã log out
//       _message = "You are not sign out";
//     },
//   );
// }

// Future _checkLogin() async {
//   // Khi mở app lên thì check xem user đã login chưa
//   final User? user = _auth.currentUser;
//   if (user != null) {
//     setState(
//       () {
//         _message = "You are signed in";
//       },
//     );
//   }
// }

//end sign in with google

  //sign in with guest
  Future signInWithGuest() async {
    try {
      UserCredential resultGuest = await _auth.signInAnonymously();
      User? user = resultGuest.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      // Fluttertoast.showToast(
      //     msg: e.toString(),
      //     gravity: ToastGravity.CENTER
      // );
      return null;
    }
  }

  Future signUp(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print(user);
      _createUser(user.user!.uid, name, phone);
    }).catchError((error) {
      //Todo
    });
  }

  //Create user with cloud firestore
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  Future _createUser(String userID, String name, String phone) async {
    final user = {'name': name, 'phone': phone};
    ref
        .doc(userID)
        .set(user)
        .then((user) => print("User added"))
        .catchError((error) => print('False to add user: $error'));
  }
}
