import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertion_1_0_chat/user_interface/add_room/add_room_navigator.dart';
import 'package:vertion_1_0_chat/user_interface/add_room/add_room_view_model.dart';
import 'package:vertion_1_0_chat/model/category.dart';
import 'package:vertion_1_0_chat/widgets/utils.dart' as ui;

class AddRoom extends StatefulWidget {
  static const String routeName = 'addroom';

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> implements AddRoomNavigator {
  AddRoomViewModel viewModel = AddRoomViewModel();

  String roomTitle = '';
  String roomDescription = '';
  var formKey = GlobalKey<FormState>();
  late MyCategory selectedItem;
  var categoryList = MyCategory.getCategory();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    selectedItem = categoryList[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(children: [
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
            title: Text('Add Room'),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 32),
            width: double.infinity,
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create New Room',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('asstets/images/room.png'),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Room Name'),
                    onChanged: (text) {
                      roomTitle = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter room Title";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButton<MyCategory>(
                    value: selectedItem,
                    items: categoryList
                        .map((category) => DropdownMenuItem<MyCategory>(
                              value: category, // Don't forget to set the value
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(category.title),
                                    Image.asset(category.image),
                                  ],
                                ),
                              ),
                            ))
                        .toList(), // Convert Iterable to List
                    onChanged: (newValue) {
                      newValue == null ? 0 : selectedItem = newValue;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: 'Enter Room Description'),
                    minLines: 1,
                    maxLines: 4,
                    onChanged: (text) {
                      roomDescription = text;
                    },
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter room Description";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                      ),
                      onPressed: (){
                        validateForm();
                      },
                      child: Text('Add Room' ,style: TextStyle(
                      color: Colors.black
                  ),)),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }



  void validateForm() {
    if (formKey.currentState?.validate() == true){
      // add Room
      viewModel.addRoom(roomTitle, roomDescription, selectedItem.id);
    }
  }

  @override
  void hideLoading() {
    ui.hideLoading(context);
  }

  @override
  void navigateToHome() {
    Timer(Duration(seconds: 5),(){
      Navigator.pop(context);
    });
  }

  @override
  void showLoading() {
    ui.showLoading(context, 'Loading....');
  }

  @override
  void showMessage(String message) {
    ui.showMessage(context, message, 'OK', (context){Navigator.pop(context);});
  }


}
