import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/database/database_helper.dart';
import 'package:vertion_1_0_chat/model/myuser.dart';
import 'package:vertion_1_0_chat/regstier/register_navigator.dart';
import 'register_navigator.dart';

import '../firebase_errors.dart';

class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator navigator;

  void registerFirebaseAuth(
      String Email ,
      String Password ,
      String firstName ,
      String lastName ,
      String userName ,)async{
    try {
      navigator.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );

      var user = MyUser(
          id: credential.user?.uid ?? "userid not found",
          Email: Email,
          userName: userName,
          firstName: firstName,
          lastName: lastName);

      var dataUser = await DatabaseHelper.registerUser(user);

      navigator.hideLoading();
      navigator.showMessage('Successfully');
      navigator.navigateToHome();

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