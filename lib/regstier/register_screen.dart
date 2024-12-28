import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  static const String routeName = "RegisterScreen";
  String FirstName = '';
  String LastName = '' ;
  String Email = '' ;
  String userName = '' ;
  String Password = '';


  @override
  Widget build(BuildContext context) {
    return Stack(
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
          body: Form(child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                ElevatedButton(onPressed: (){


                }, child: Text('Create Account'))
              ],
            ),
          )),
        )
        
      ],
    );
  }
}
