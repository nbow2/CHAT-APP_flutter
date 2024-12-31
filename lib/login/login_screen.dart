import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/Home/home_screen.dart';
import 'package:vertion_1_0_chat/login/login_navgiator.dart';
import 'package:vertion_1_0_chat/login/login_view_model.dart';
import 'package:vertion_1_0_chat/regstier/register_screen.dart';
import 'package:vertion_1_0_chat/widgets/utils.dart' as ui;

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {

  String Email = '' ;

  String Password = '';

  var formKey = GlobalKey<FormState>();

  LoginViewModel viewModel = LoginViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
            title: Text('Login') , centerTitle: true,),
          body: Form(
              key: formKey,
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Welcome Back!' ,style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold

                    ),),
                    SizedBox(height: 18,),
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
                        }, child: Text('Login' ,style: TextStyle(
                        color: Colors.black
                    ),)),
                    SizedBox(
                      height: 18,
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(RegisterScreen.routeName);
                        }, child: Text('Create Account ?' ,style: TextStyle(
                      fontSize: 16
                    ),))
                  ],
                ),
              )),
        )

      ],
    );
  }

  void validateForm() {

    if(formKey.currentState!.validate() == true){
      viewModel.loginFirebaseAuth(Email, Password);
    //  Navigator.pop(context);
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
        'OK', (context){
      Navigator.pop(context);
        });
  }

  @override
  void navigateToHome() {
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    }
}
