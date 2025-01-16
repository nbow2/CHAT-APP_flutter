import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/database/database_helper.dart';
import 'package:vertion_1_0_chat/user_interface/login/login_navgiator.dart';
import 'package:vertion_1_0_chat/firebase_errors.dart';


class LoginViewModel extends ChangeNotifier{

  late LoginNavigator navigator ;

  void loginFirebaseAuth(String Email , String Password)async{
    try {
      navigator.showLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email,
          password: Password
      );

      navigator.hideLoading();
      navigator.showMessage("Successfully");
      //navigator.navigateToHome();

      var userObj = await DatabaseHelper.getUSer(credential.user?.uid ?? "useridnotFound");
      if(userObj == null){
        navigator.hideLoading();
        navigator.showMessage('user not saved to database ');
      }
        navigator.navigateToHome(userObj!);



      print('the user id ${credential.user?.uid}');

    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.userNotFound) {

        navigator.hideLoading();
        navigator.showMessage("User not found");

        print('No user found for that email.');
      } else if (e.code == FirebaseErrors.wrongPassword) {

        navigator.hideLoading();
        navigator.showMessage("Wrong password provided for that user.");

        print('Wrong password provided for that user.');
      }
    }
  }
}