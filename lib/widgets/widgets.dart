import 'package:flutter/material.dart';


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
              onPressed: () {},
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

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: "$hintText",
      hintStyle: TextStyle(
          fontSize: 20,
          fontFamily: "Signatra"
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
    fontSize: 16
  );
}




TextStyle mediumTextStyle(){
  return TextStyle(
      color: Colors.black,
      fontSize: 18
  );
}