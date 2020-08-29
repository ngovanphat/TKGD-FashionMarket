import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {


  getUserByName(String username) async{
      return await Firestore.instance.collection("users")
          .where("name", isEqualTo: username)
          .getDocuments();
  }

  getUserByUserEmail(String email) async {
    return await Firestore.instance.collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  uploadUserInfo(userMap){
    Firestore.instance.collection("users").add(userMap).catchError((onError){
      print(onError);
    });
  }

  createChatRoom(String chatRoomId, chatRoomMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .setData(chatRoomMap)
        .catchError((onError){
          print(onError);
        });
  }

  setConservationMessages(String chatRoomId, messageMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((onError){
          print(onError);
    });
  }

  getConservationMessages(String chatRoomId) async {
    return await Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy("time", descending: false)
        .snapshots();
  }

  getChatRooms(String username) async {
    return await Firestore.instance.collection("ChatRoom")
        .where("users", arrayContains: username)
        .snapshots();
  }

}