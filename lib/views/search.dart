import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_market/widgets/widgets.dart';
import 'package:fashion_market/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fashion_market/helpers/constants.dart';
import 'package:fashion_market/views/conversation.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethod = new DatabaseMethods();
  TextEditingController keyword = new TextEditingController();

  QuerySnapshot querySnapshot;
  initialSearch(){
    databaseMethod.getUserByName(keyword.text.trim()).then(
            (val) {
         setState(() {
           querySnapshot = val;
         });
        }
    );
  }
  @override
  void initState(){
    super.initState();
  }


  createChatRoomAndStartConservation(String username){
    if(username != Constants.username){
      String chatRoomId =  getChatRoomId(username, Constants.username);

      List<String> users = [username, Constants.username];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatRoomId": chatRoomId
      };
      databaseMethod.createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Conversation(chatRoomId),
      ));
    }
    else {
      print("You don't need to chat to yourself");
    }
  }


  Widget SearchTile(String username, String email){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("$username", style: TextStyle(
                    fontFamily: "sans-serif",
                    fontSize: 20
                ),
                  textAlign: TextAlign.start,
                ),
                Text("$email", style: simpleTextFieldStyle(),)
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
                createChatRoomAndStartConservation(username);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text("Message", style: TextStyle(
                  fontSize: 11
              )),
            ),
          )
        ],
      ),
    );
  }
  Widget searchList(){
    return querySnapshot !=null ? ListView.builder(
      shrinkWrap: true,
      itemCount: querySnapshot.documents.length,
      itemBuilder: (context, index){
        return SearchTile(
          querySnapshot.documents[index].get("name"),
          querySnapshot.documents[index].get("email"),
        );
      },
    ): Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSignIn(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(60),
                 border: Border.all(color: Colors.black54),
                 color: Colors.black54
               ),
               padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
               margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
               child: Row(
                 children: <Widget>[
                   Expanded(
                       child: TextField(
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 15
                         ),
                          controller: keyword,
                          decoration: InputDecoration(
                            hintText: "search keyword...",
                            hintStyle: TextStyle(
                              color: Colors.white
                            ),
                            border: InputBorder.none
                          ),
                       )
                   ),
                  GestureDetector(
                    onTap: (){
                      initialSearch();

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
                      child: Icon(Icons.search),
                    ),
                  )
                 ],
               ),
             ),
            searchList()
          ],
        ),
      ),
    );
  }
}




getChatRoomId(String a, String b) {
  if(a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  }
  else {
    return "$a\_$b";
  }
}