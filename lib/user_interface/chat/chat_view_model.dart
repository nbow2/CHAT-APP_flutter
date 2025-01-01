import 'package:flutter/material.dart';
import 'package:vertion_1_0_chat/database/database_helper.dart';
import 'package:vertion_1_0_chat/model/message.dart';
import 'package:vertion_1_0_chat/model/myuser.dart';
import 'package:vertion_1_0_chat/model/room.dart';
import 'package:vertion_1_0_chat/user_interface/chat/chat_navigator.dart';

class ChatViewModel extends ChangeNotifier{
    late ChatNavigator navigator ;
    late MyUser user;
    late Room room ;

    void sendMassage(String content){
        Massage massage = Massage(
            roomId: room.roomId,
            content: content,
            senderId: user.id,
            senderName: user.userName,
            dataTime: DateTime.now().millisecondsSinceEpoch);
        try{
           var res = DatabaseHelper.insertMassage(massage);
           navigator.clearMassage();

        }catch(e){
            navigator.showMessage(e.toString());
        }

    }
}