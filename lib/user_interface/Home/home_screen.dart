import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertion_1_0_chat/database/database_helper.dart';
import 'package:vertion_1_0_chat/model/room.dart';
import 'package:vertion_1_0_chat/user_interface/Home/home_navigator.dart';
import 'package:vertion_1_0_chat/user_interface/Home/home_view_model.dart';
import 'package:vertion_1_0_chat/user_interface/add_room/add_room.dart';
import 'package:vertion_1_0_chat/widgets/room_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeNavigator{
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.navigator = this ;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> homeViewModel,
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
              title: Text('Home'),
              centerTitle: true,
            ),
          floatingActionButton: FloatingActionButton(
              onPressed:(){
                Navigator.of(context).pushNamed(AddRoom.routeName);
              } ,
              child: Icon(Icons.add , color: Colors.white , ),
              backgroundColor: Colors.blue,
              ),
          body: StreamBuilder<QuerySnapshot<Room>>(
              stream: DatabaseHelper.getRooms(),
              builder: (context , asyncSnapShot){
                if(asyncSnapShot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else if (asyncSnapShot.hasError){
                  return Text(asyncSnapShot.error.toString());
                } else {
                  var roomList = asyncSnapShot.data?.docs.map((doc) => doc.data()).toList();
                  return GridView.builder(
                    itemBuilder: (context, index){
                      return RoomWidget(room: roomList[index],);
                    },
                    itemCount: roomList!.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 8,)
                  );
                  }

              }),

        ),
      ]),
    );
  }

}
