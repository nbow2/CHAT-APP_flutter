import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertion_1_0_chat/model/message.dart';
import 'package:vertion_1_0_chat/provider/user_provider.dart';

class MessageWidget extends StatelessWidget {

  Massage massage;
  MessageWidget({required this.massage});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return provider.user?.id == massage.senderId ?
    SendMessage(massage: massage) : ReceiveMessage(massage: massage);
  }
}

class SendMessage extends StatelessWidget {

  Massage massage ;
  SendMessage({required this.massage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(massage.senderName),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 32),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12)
            )
          ),
          child: Text(massage.content , style: TextStyle(color: Colors.white)),
        ),
        Text(massage.dataTime ,
          style: TextStyle(
            color: Colors.black54
          ),)
      ],
    );
  }
}

class ReceiveMessage extends StatelessWidget {

  Massage massage ;
  ReceiveMessage({required this.massage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(massage.senderName),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 32),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
              )
          ),
          child: Text(massage.content , style: TextStyle(color: Colors.white),),
        ),
        Text(massage.dataTime ,
          style: TextStyle(
              color: Colors.black
          ),),
      ],
    );
  }
}
