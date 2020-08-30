import 'package:fashion_market/services/database.dart';
import 'package:fashion_market/views/conversation.dart';
import 'package:fashion_market/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_market/services/auth.dart';
import 'package:fashion_market/helpers/constants.dart';
import 'package:fashion_market/helpers/helperfunction.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();


  Stream chatRoomStream;

  Widget chatRoomList(){
    return StreamBuilder(
      stream: chatRoomStream,
      builder: (context, snapshot){
        return snapshot.hasData ? ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ChatRoomTile(
                  snapshot.data.documents[index].get("chatRoomId")
                      .toString().replaceAll('_', '')
                      .replaceAll(Constants.username,''),
                  snapshot.data.documents[index].get("chatRoomId")
              ),
            );
          },
        ) :  Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.username =  await HelperFunction.getUserNameSharedPreference();
    databaseMethods.getChatRooms(Constants.username).then((val){
      setState(() {
        chatRoomStream = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: chatRoomList(),
      ),
    );
  }
}

class ChatRoomTile extends StatelessWidget {

  final String username;
  final String chatRoomId;
  ChatRoomTile(this.username, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Conversation(chatRoomId),
        ));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 5),
              padding: EdgeInsets.all(8),
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Text(
                "${username.substring(0,1).toUpperCase()}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(width: 8,),
            Text(
              username,
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 25,
              ),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
