import 'package:flutter/material.dart';
import 'package:fashion_market/views/search.dart';


Widget appBarSignIn(BuildContext context){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Fashion Market',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontFamily: "Signatra",
          ),
        ),
      ],
    ),
  );
}

Widget appBarHome(BuildContext context){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Fashion Market',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontFamily: "Signatra",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SearchScreen()
                ));
              },
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}

Widget appBarConversation(BuildContext context, String username){
  return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      title: Row(
        children: <Widget>[
          Container(
            //padding: EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50)
            ),
            child: Text(
              "${username.substring(0,1).toUpperCase()}",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(width: 8,),
          Text(
            username,
            style: TextStyle(
              fontFamily: "sans-serif",
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
      iconTheme: IconThemeData(
        color: Colors.blue, //change your color here
      ),
  );
}

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: "$hintText",
      hintStyle: TextStyle(
          fontSize: 15,
          fontFamily: "sans-serif"
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
      )
  );
}

TextStyle simpleTextFieldStyle(){
  return TextStyle(
    color: Colors.black,
    fontSize: 11
  );
}




TextStyle mediumTextStyle(){
  return TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontFamily: "sans-serif"
  );
}