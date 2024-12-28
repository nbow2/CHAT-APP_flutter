import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/regstier/register_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes:{
        RegisterScreen.routeName : (context) => RegisterScreen(),
      },
      initialRoute: RegisterScreen.routeName,

    );
  }
}

