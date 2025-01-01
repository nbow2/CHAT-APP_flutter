import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vertion_1_0_chat/model/message.dart';
import 'package:vertion_1_0_chat/model/myuser.dart';
import 'package:vertion_1_0_chat/model/room.dart';

class DatabaseHelper{

  static Future<void> registerUser(MyUser user)async{
    return getCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> getUSer(String UserId)async{
    var docSnapShot = await getCollection().doc(UserId).get();
    return docSnapShot.data();
  }

  static Future<void> craeteRoomToFireStore(Room room)async{
    var docRef = getRoomCollection().doc();
    room.roomId = docRef.id ;
    return docRef.set(room);
  }

  static Stream<QuerySnapshot<Room>> getRooms(){
    return getRoomCollection().snapshots();
  }

  static Future<void> insertMassage(Massage massage)async{
    var messageCollection = getMassageCollection(massage.roomId);
    var docRef = messageCollection.doc();
    massage.id = docRef.id ;
    return docRef.set(massage);
  }

  static CollectionReference<MyUser> getCollection(){
    return FirebaseFirestore.instance.collection(MyUser.CollectionName).
    withConverter<MyUser>(
        fromFirestore:( (snapshot , options) => MyUser.formJason(snapshot.data()!) )
        , toFirestore: ( (user , options ) => user.toJason())
    );
  }

  static CollectionReference<Room> getRoomCollection(){
    return FirebaseFirestore.instance.collection(Room.collectionName).
    withConverter<Room>(
        fromFirestore:( (snapshot , options) => Room.fromJson(snapshot.data()!) )
        , toFirestore: ( (room , options ) => room.toJson())
    );
  }

  static CollectionReference<Massage> getMassageCollection(String roomId){
    return FirebaseFirestore.instance.collection(Room.collectionName).doc(roomId).collection(Massage.CollectionName).
    withConverter(
        fromFirestore: ((snapshot , options) => Massage.fromJson(snapshot.data()!)),
        toFirestore: ( (massage , options ) => massage.toJson()));
  }
}