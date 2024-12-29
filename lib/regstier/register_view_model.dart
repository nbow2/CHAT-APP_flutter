import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/regstier/register_navigator.dart';
import 'register_navigator.dart';

import '../firebase_errors.dart';

class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator navigator;

  void registerFirebaseAuth(String Email , String Password)async{
    try {
      navigator.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      navigator.hideLoading();
      navigator.showMessage('Successfully');
      print('firebase auth user id ${credential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {

        navigator.hideLoading();
        navigator.showMessage('password to weak');

        print('The password provided is too weak.');
      } else if (e.code == FirebaseErrors.emailAlreadyInUse) {

        navigator.hideLoading();
        navigator.showMessage('The account already exists for that email.');

        print('The account already exists for that email.');
      }
    } catch (e) {

      navigator.hideLoading();
      navigator.showMessage('something went wrong');
      print(e);
    }
  }
}