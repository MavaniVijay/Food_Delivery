import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAuthentication extends ChangeNotifier {
  String email;
  String uid;
  dynamic errorMessage = '';

  ///**********  Get   ********///
  String get getUid => uid;
  dynamic get getErrorMessage => errorMessage;
  String get getEmail => email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future createUserAuth(String email, String password) async {
    // bool success = false;
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      //bool success = true;
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid);
      print("THis is Out UID ---> $getUid");
      print("User Create in ----> ${userCredential.user}");
      //print(success);
      notifyListeners();
    } catch (e) {
      switch (errorMessage) {
        case 'User not-found':
          errorMessage = 'User is Not Found';
          print(errorMessage);
          break;
        case 'Worng-password':
          errorMessage = 'Wornge Password';
          print(errorMessage);
          break;
        case 'Invalid - email':
          errorMessage = 'Invalid - Email';
          print(errorMessage);
      }
    }
    return null;
  }

  Future signUserAuth(String email, String password) async {
    //bool success = false;
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance(); //9.1
      //bool success = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid); //9.2
      print("THis is Out UID ---> $getUid");
      // print("Success MSG ----> ${success}");
      print("User Sign in ----> ${userCredential.user}");
      notifyListeners();
    } catch (e) {
      // print("Error message ---> ${e}");
      switch (errorMessage) {
        case 'account extis with different creditalis':
          errorMessage = 'Account exits With Different Creditials';
          print(errorMessage);
          break;
        case 'Invalid - email':
          errorMessage = 'Invalid - Email';
          print(errorMessage);
      }
    }
    return null;
  }

  void signOut() async {
    await _auth.signOut();
  }
}
