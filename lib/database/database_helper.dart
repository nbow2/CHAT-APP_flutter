import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vertion_1_0_chat/model/myuser.dart';

class DatabaseHelper{

  static Future<void> registerUser(MyUser user)async{
    return getCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> getUSer(String UserId)async{
    var docSnapShot = await getCollection().doc(UserId).get();
    return docSnapShot.data();
  }

  static CollectionReference<MyUser> getCollection(){
    return FirebaseFirestore.instance.collection(MyUser.CollectionName).
    withConverter<MyUser>(
        fromFirestore:( (snapshot , options) => MyUser.formJason(snapshot.data()!) )
        , toFirestore: ( (user , options ) => user.toJason())
    );
  }
}