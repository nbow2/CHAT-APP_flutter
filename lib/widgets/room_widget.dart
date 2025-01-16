import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/model/room.dart';
import 'package:vertion_1_0_chat/user_interface/chat/chat_screen.dart';

class RoomWidget extends StatelessWidget {
   Room room ;

   RoomWidget({ required this.room});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ChatScreen.routeName , arguments: room);
      },
      child: Container(
        margin: EdgeInsets.all(17),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3)
            ),
          ]
        ),
        child: Column(
          children: [
            Image.asset('asstets/images/${room.catagoryId}.png' ,
              height: MediaQuery.of(context).size.height * 0.12,
              fit: BoxFit.fill,),
            SizedBox(height: 10,),
            Text(room.title ,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),)

          ],
        ),
      ),
    );
  }
}
