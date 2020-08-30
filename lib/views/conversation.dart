import 'package:fashion_market/helpers/sizes_helpers.dart';
import 'package:fashion_market/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_market/widgets/widgets.dart';
import 'package:fashion_market/helpers/constants.dart';
class Conversation extends StatefulWidget {
  final String chatRoomId;
  Conversation(this.chatRoomId);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {

  TextEditingController message = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatMessageStream;

  Widget chatMessageList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: StreamBuilder(
        stream: chatMessageStream,
        builder: (context, snapshot) {
          return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              return MessageTile(snapshot.data.documents[index].get("message"),snapshot.data.documents[index].get("sendBy") == Constants.username);
            },
          ) : Container(child: Center(child: CircularProgressIndicator(),),);
        },
      ),
    );
  }


  sendMessage(){
    if(message.text.isNotEmpty){
      Map<String, dynamic> messageMap = {
        "message": message.text.trim(),
        "sendBy": Constants.username,
        "time": DateTime.now().millisecondsSinceEpoch,
      };
      databaseMethods.setConservationMessages(widget.chatRoomId, messageMap);
      message.clear();
    }
  }

  @override
  void initState() {
    databaseMethods.getConservationMessages(widget.chatRoomId).then((val){
       setState(() {
         chatMessageStream = val;
       });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarConversation(context, widget.chatRoomId.replaceAll('_', '').replaceAll(Constants.username, '')),
      body: Container(
        child: Stack(
          children: <Widget>[
            chatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(child: Icon(Icons.menu,),),
                          Container(child: Icon(Icons.camera_alt),),
                          Container(child: Icon(Icons.image),),
                          Container(child: Icon(Icons.keyboard_voice),),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                            controller: message,
                            decoration: InputDecoration(
                                hintText: "search keyword...",
                                hintStyle: TextStyle(
                                    color: Colors.white
                                ),
                                border: InputBorder.none
                            ),
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        //initialSearch();
                        sendMessage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0x36FFFFFF),
                                  const Color(0x0FFFFFFF),
                                ]
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.send),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;
  MessageTile(this.message, this.isSendByMe);
  double sizeRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSendByMe ? [
              const Color(0xff007EF4),
              const Color(0xff2A75BC)
            ] : [
              const Color(0x1A000000),
              const Color(0x1A000000),
            ]
          ),
          borderRadius: isSendByMe ? BorderRadius.only(
            topLeft: Radius.circular(sizeRadius),
            topRight: Radius.circular(sizeRadius),
            bottomLeft: Radius.circular(sizeRadius),
            bottomRight: Radius.circular(sizeRadius/3)
          ) : BorderRadius.only(
              topLeft: Radius.circular(sizeRadius),
              topRight: Radius.circular(sizeRadius),
              bottomRight: Radius.circular(sizeRadius),
              bottomLeft: Radius.circular(sizeRadius/3)
          )
        ),
        child: Text(
          message,
          style: TextStyle(
              color: isSendByMe ? Colors.white : Colors.black,
              fontSize: 18
            ),),
      ),
    );
  }
}

