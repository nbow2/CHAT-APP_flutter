import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:vertion_1_0_chat/database/database_helper.dart';
import 'package:vertion_1_0_chat/model/myuser.dart';

class UserProvider extends ChangeNotifier {
  MyUser? user ;
  User? firebasUser ;

  UserProvider(){
    firebasUser = FirebaseAuth.instance.currentUser;
    initUser();
  }

  initUser()async{
    if(firebasUser != null){
      user = await DatabaseHelper.getUSer(firebasUser?.uid ?? 'id not found or user not exits');
    }
  }



}