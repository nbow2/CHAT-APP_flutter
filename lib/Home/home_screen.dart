import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
      ),
      Image.asset(
        "asstets/images/background.png",
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Home'),
            centerTitle: true,
          ),
          body: Container()),
    ]);
  }
}
