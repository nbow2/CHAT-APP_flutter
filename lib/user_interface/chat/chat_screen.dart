import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertion_1_0_chat/model/room.dart';
import 'package:vertion_1_0_chat/user_interface/chat/chat_navigator.dart';
import 'package:vertion_1_0_chat/user_interface/chat/chat_view_model.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements ChatNavigator{

  ChatViewModel viewModel = ChatViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;

  }

  @override
  Widget build(BuildContext context) {

    var arg = ModalRoute.of(context)?.settings.arguments as Room ;

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
            title: Text(arg.title),
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
            child: Column(
              children: [
                Expanded(child: Container()),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        hintText: 'Your Message is ?',
                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12)
                            )
                        )
                      ),
                    )),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,

                      ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Send' ,style: TextStyle(color: Colors.white),),
                            SizedBox(width: 5,),
                            Icon(Icons.send_outlined ,color: Colors.white,)
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
    ]
        )
    );
  }
}
