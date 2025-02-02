import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertion_1_0_chat/model/myuser.dart';
import 'package:vertion_1_0_chat/provider/user_provider.dart';
import 'package:vertion_1_0_chat/user_interface/Home/home_screen.dart';
import 'package:vertion_1_0_chat/firebase_errors.dart';
import 'package:vertion_1_0_chat/user_interface/regstier/register_navigator.dart';
import 'package:vertion_1_0_chat/user_interface/regstier/register_view_model.dart';
import 'package:vertion_1_0_chat/widgets/utils.dart' as ui;

class RegisterScreen extends StatefulWidget {

  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator{
  String FirstName = '';

  String LastName = '' ;

  String Email = '' ;

  String userName = '' ;

  String Password = '';

  RegisterViewModel viewModel = RegisterViewModel() ;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> viewModel,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Image.asset("asstets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,)
          ,Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text('Create Account') , centerTitle: true,),
            body: Form(
                key: formKey,
                child:
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Create' ,style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name'
                    ),
                    onChanged: (text){
                      FirstName = text ;
                    },
                    validator: (text){
                      if(text == null || text.trim().isEmpty)
                        {
                          return 'Please Enter First name';
                        }
                      return null ;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Last Name'
                    ),
                    onChanged: (text){
                      LastName = text ;
                    },
                    validator: (text){
                      if(text == null || text.trim().isEmpty)
                      {
                        return 'Please Enter Last name';
                      }
                      return null ;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email'
                    ),
                    onChanged: (text){
                      Email = text ;
                    },
                    validator: (text){

                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text!);

                      if(!emailValid){
                        return 'Please enter valid email';
                      }

                      if(text == null || text.trim().isEmpty)
                      {
                        return 'Please Enter Email';
                      }
                      return null ;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'User Name'
                    ),
                    onChanged: (text){
                      userName = text ;
                    },
                    validator: (text){
                      if(text == null || text.trim().isEmpty)
                      {
                        return 'Please Enter User name';
                      }
                      return null ;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                    onChanged: (text){
                      Password = text ;
                    },
                    validator: (text){

                      if(text!.length < 8 ){
                        return 'Password must be at least 8CH';
                      }

                      if(text == null || text.trim().isEmpty)
                      {
                        return 'Please Enter Password';
                      }
                      return null ;
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                      onPressed: (){
                    validateForm();
                  }, child: Text('Create Account' ,style: TextStyle(
                    color: Colors.black
                  ),))
                ],
              ),
            )),
          )

        ],
      ),
    );
  }

  void validateForm() async{

    if (formKey.currentState!.validate() == true){

      viewModel.registerFirebaseAuth(Email, Password , FirstName, LastName , userName);
     // Navigator.pop(context);

    }
  }

  @override
  void hideLoading() {
   ui.hideLoading(context);
  }

  @override
  void showLoading() {
   ui.showLoading(context, 'Loading....');
  }

  @override
  void showMessage(String message) {
    ui.showMessage(context, message,
        'OK',
        (context){
      Navigator.pop(context);
        });
  }

  @override
  void navigateToHome(MyUser user) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.user = user;
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
  }
}
