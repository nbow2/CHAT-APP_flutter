import 'package:flutter/material.dart';


void showLoading(BuildContext context , String text){
  showDialog(context: context,
      builder: (context) {
      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircularProgressIndicator(),
              Text(text)
            ],
          ),
        ),
      );
      });
}

void hideLoading(BuildContext context){
  Navigator.pop(context);
}

void showMessage(BuildContext context , String text ,
    String posActionText , Function posAction
,{String? negActionText , Function? negAction}){

  showDialog(context: context,
      builder: (context){

    return AlertDialog(
      content: Text(text),
      actions: [
        TextButton(
            onPressed: (){
              posAction(context);
            }, child: Text(posActionText))
      ],
    );

      });
}
