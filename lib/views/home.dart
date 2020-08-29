import 'package:fashion_market/views/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_market/views/chat.dart';
import 'package:fashion_market/views/profile.dart';
import 'package:fashion_market/views/add_item.dart';
import 'package:fashion_market/views/favorite.dart';
import 'package:fashion_market/widgets/widgets.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails()),
                            );
                          },
                          child: SizedBox(
                            height: 330,
                            child: Column(
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:
                                        BorderSide(color: Colors.white, width: 2),
                                  ),
                                  child: Image.asset('assets/images/Capture.PNG',
                                      fit: BoxFit.contain),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Nike Air Max 97",
                                          style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "\$100",
                                            style: TextStyle(
                                                fontSize: 23,
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
                                                      fontSize: 16,
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
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails()),
                            );
                          },
                          child: SizedBox(
                            height: 330,
                            child: Column(
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:
                                        BorderSide(color: Colors.white, width: 2),
                                  ),
                                  child: Image.asset(
                                      'assets/images/balenspeed.jpg',
                                      fit: BoxFit.contain),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Balenciaga Speed",
                                          style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "\$500",
                                            style: TextStyle(
                                                fontSize: 23,
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
                                                      fontSize: 16,
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
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 330,
                          child: Column(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.white, width: 2),
                                ),
                                child: Image.asset(
                                    'assets/images/guccirhyton.jpg',
                                    fit: BoxFit.contain),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Gucci Rhyton",
                                        style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "\$1,000",
                                          style: TextStyle(
                                              fontSize: 23,
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
                                                    fontSize: 16,
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
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 330,
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
                                        style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "\$450",
                                          style: TextStyle(
                                              fontSize: 23,
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
                                                    fontSize: 16,
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 330,
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
                                        style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "\$700",
                                          style: TextStyle(
                                              fontSize: 23,
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
                                                    fontSize: 16,
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
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 330,
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
                                        style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "\$450",
                                          style: TextStyle(
                                              fontSize: 23,
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
                                                    fontSize: 16,
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 330,
                          child: Column(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                child: Image.asset('assets/images/mcm.jpg',
                                    fit: BoxFit.contain),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "MCM Backpack",
                                        style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "\$1,000",
                                          style: TextStyle(
                                              fontSize: 23,
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
                                                    fontSize: 16,
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
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 330,
                          child: Column(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                child: Image.asset('assets/images/yzy.jpg',
                                    fit: BoxFit.contain),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Yeezy V1",
                                        style: TextStyle(fontSize: 23,fontFamily: "Signatra"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "\$300",
                                          style: TextStyle(
                                              fontSize: 23,
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
                                                    fontSize: 16,
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Favorite(),
          AddItem(),
          Chat(),
          Profile(),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(destination.icon),
            ),
            title: Text(destination.title),
          );
        }).toList(),
        iconSize: 30,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home),
  Destination('Favorite', Icons.favorite_border),
  Destination('Add', Icons.add),
  Destination('Chat', Icons.chat_bubble_outline),
  Destination('Profile', Icons.person),
];
