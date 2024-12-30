import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/Home/home_screen.dart';
import 'package:vertion_1_0_chat/login/login_screen.dart';
import 'package:vertion_1_0_chat/regstier/register_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes:{
        RegisterScreen.routeName : (context) => RegisterScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      initialRoute: LoginScreen.routeName,

    );
  }
}

