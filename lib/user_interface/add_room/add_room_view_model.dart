import 'package:flutter/cupertino.dart';
import 'package:vertion_1_0_chat/database/database_helper.dart';
import 'package:vertion_1_0_chat/model/room.dart';
import 'package:vertion_1_0_chat/user_interface/add_room/add_room_navigator.dart';

class AddRoomViewModel extends ChangeNotifier {
  late AddRoomNavigator navigator ;

  void addRoom(String roomTitle , String roomDescription , String catagoryId)async{
    Room room = Room(
        roomId: "",
        title: roomTitle,
        catagoryId: catagoryId,
        description: roomDescription
    );
    try{
      navigator.showLoading();
      var createdRoom = await DatabaseHelper.craeteRoomToFireStore(room);
      navigator.hideLoading();
      navigator.showMessage('Room was added Done');
      navigator.navigateToHome();
    }catch(e){
      navigator.hideLoading();
      navigator.showMessage(e.toString());
    }
    }
}