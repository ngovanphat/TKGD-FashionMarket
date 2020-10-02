import 'package:fashion_market/helpers/authenticate.dart';
import 'package:fashion_market/helpers/constants.dart';
import 'package:fashion_market/helpers/helperfunction.dart';
import 'package:fashion_market/helpers/sizes_helpers.dart';
import 'package:fashion_market/services/auth.dart';
import 'package:fashion_market/views/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  AuthMethods authMethods = new AuthMethods();

  onClickSignOut(){
    authMethods.signOut().then((value) {
      Constants.username = "";
      HelperFunction.saveUserLoggedInSharedPreference(false);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Authenticate()
      ));
    });
  }
  Widget bodyPart(){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            alignment: Alignment.topCenter,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: Colors.blue
              ),
              child: Center(
                child: Text(Constants.username.substring(0,1).toUpperCase(), style: TextStyle(
                  fontSize: 80,
                  fontFamily: "sans-serif",
                  color: Colors.white,
                ),),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(Constants.username,
            style: TextStyle(
              fontSize: 50,
              fontFamily: "sans-serif",
              color: Colors.black
            ),),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: (){
              onClickSignOut();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: displayWidth(context)*2/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.blue
              ),
              child: Text(
                "Sign Out",
                style: TextStyle(
                fontFamily: "sans-serif",
                fontSize: 20,
                color: Colors.white
              ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget panelPart() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            child: Text("List item",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "sans-serif",
            ),)
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(20),
                        sliver:  SliverGrid.count(
                          childAspectRatio: (3/5),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => ProductDetails()),
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side:
                                        BorderSide(color: Colors.white, width: 2),
                                      ),
                                      child: Image.asset('assets/images/Capture.PNG',
                                          fit: BoxFit.cover),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Nike Air Max 97",
                                              style: TextStyle(fontSize: 15,fontFamily: "sans-serif"),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                "\$100",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(Icons.location_on,
                                                      size: 16,
                                                      color: Colors.black38),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Text(
                                                      "Ho Chi Minh City",
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.black38),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails()),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.white, width: 2),
                                    ),
                                    child: Image.asset('assets/images/gvc.jpg',
                                        fit: BoxFit.contain),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Givenchy Distressed",
                                            style: TextStyle(fontSize: 15,fontFamily: "sans-serif"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "\$450",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.location_on,
                                                    size: 16, color: Colors.black38),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    "Ho Chi Minh City",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails()),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.white, width: 2),
                                    ),
                                    child: Image.asset('assets/images/slpsl06.jpg',
                                        fit: BoxFit.contain),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Saint Laurent",
                                            style: TextStyle(fontSize: 15,fontFamily: "sans-serif"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "\$700",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.location_on,
                                                    size: 16, color: Colors.black38),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    "Ho Chi Minh City",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails()),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.white, width: 2),
                                    ),
                                    child: Image.asset('assets/images/gucci.jpg',
                                        fit: BoxFit.contain),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Gucci Slides",
                                            style: TextStyle(fontSize: 15,fontFamily: "sans-serif"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "\$450",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.location_on,
                                                    size: 16, color: Colors.black38),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    "Ho Chi Minh City",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 50,
        maxHeight: displayHeight(context),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero),
        panel: panelPart(),
        body: bodyPart(),
      ),
    );
  }
}

