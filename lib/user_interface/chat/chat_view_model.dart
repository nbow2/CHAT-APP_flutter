import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vertion_1_0_chat/database/database_helper.dart';
import 'package:vertion_1_0_chat/model/message.dart';
import 'package:vertion_1_0_chat/model/myuser.dart';
import 'package:vertion_1_0_chat/model/room.dart';
import 'package:vertion_1_0_chat/user_interface/chat/chat_navigator.dart';

class ChatViewModel extends ChangeNotifier {
    late ChatNavigator navigator;
    late MyUser user;
    late Room room;
    late Stream<QuerySnapshot<Massage>> streamMassage;

    // Function to get formatted time
    String getFormattedTime() {
        return DateFormat('h:mm a').format(DateTime.now());
    }

    void sendMassage(String content) {
        Massage massage = Massage(
            roomId: room.roomId,
            content: content,
            senderId: user.id,
            senderName: user.userName,
            dataTime: getFormattedTime() ,
            time: DateTime.now().millisecondsSinceEpoch
        );
        try {
            // Insert the message into the database
            DatabaseHelper.insertMassage(massage);
            // Clear the input field in the UI
            navigator.clearMassage();
        } catch (e) {
            // Show an error message to the user
            navigator.showMessage(e.toString());
        }
    }

    void listenForUpdate(){
       streamMassage = DatabaseHelper.getMassageFormDatabase(room.roomId);
    }
}
