import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertion_1_0_chat/provider/user_provider.dart';
import 'package:vertion_1_0_chat/user_interface//Home/home_screen.dart';
import 'package:vertion_1_0_chat/user_interface//login/login_screen.dart';
import 'package:vertion_1_0_chat/user_interface//regstier/register_screen.dart';
import 'package:vertion_1_0_chat/user_interface/add_room/add_room.dart';
import 'package:vertion_1_0_chat/user_interface/chat/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return MaterialApp(
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddRoom.routeName: (context) => AddRoom(),
        ChatScreen.routeName: (context) => ChatScreen(),
      },
      initialRoute: userProvider.firebasUser == null ?  LoginScreen.routeName : HomeScreen.routeName,
    );
  }
}
