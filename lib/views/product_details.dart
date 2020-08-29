import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_market/helpers/sizes_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> imageUrl = [
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4535b1d1-bc3b-4ef9-91b4-a77fb0332855/air-max-97-essential-shoe-jg3ZQc.jpg',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b7a618ab-26e8-4fb1-8003-5345a3779609/air-max-97-essential-shoe-jg3ZQc.jpg',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/835c02c6-dcc9-447d-81fe-ccc6ad4f550b/air-max-97-essential-shoe-jg3ZQc.jpg',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e0eec555-e332-470e-8a6b-e86b740562f5/air-max-97-essential-shoe-jg3ZQc.jpg',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/13a9104c-9a55-48db-a07a-c2dafba7d193/air-max-97-essential-shoe-jg3ZQc.jpg',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/753e1ac2-e971-48c6-9d30-73039049850c/air-max-97-essential-shoe-jg3ZQc.jpg',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5b125eb4-ff83-496c-b557-d11cd50adc9c/air-max-97-essential-shoe-jg3ZQc.jpg',
  'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/c8ff0fa6-1bbf-4f52-8de6-15af874a33c4/air-max-97-essential-shoe-jg3ZQc.jpg',
];

class ProductDetails extends StatefulWidget {
  ProductDetails({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                      // để che hiệu ứng glow khi cuộn ở 2 đầu
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          autoPlay: false,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          child: Text(
                            "Nike Air Max 97 Essential",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 32, fontFamily: "Signatra"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 2, color: Colors.white)),
                                    child: Icon(Icons.star,
                                        color: Colors.orange, size: 25),
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "100",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "USD",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black38,
                                  fontFamily: "Signatra",
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
                                child: Text(
                                  "In Stock",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: "Signatra"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 10, 0),
                          child: Text(
                            "Uploaded 2 days ago in Hồ Chí Minh",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontFamily: "Signatra"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2, color: Colors.redAccent)),
                                child: Icon(Icons.favorite,
                                    color: Colors.redAccent, size: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontFamily: "Signatra"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2, color: Colors.blueAccent)),
                                child: Icon(Icons.message,
                                    color: Colors.blueAccent, size: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Message",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontFamily: "Signatra"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2, color: Colors.orange)),
                                child: Icon(Icons.rate_review,
                                    color: Colors.orange, size: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Rate",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontFamily: "Signatra"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2, color: Colors.lightBlue)),
                                child: Icon(Icons.more_horiz,
                                    color: Colors.lightBlue, size: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontFamily: "Signatra"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    _sellerInfo(),
                    SizedBox(height: 10),
                    _details(),
                    SizedBox(height: 10),
                    _description(),
                    SizedBox(height: 10),
                    _location(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RawMaterialButton(
                        elevation: 2.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Icon(
                          Icons.arrow_back,
                          color: Colors.blue,
                          size: 25,
                        ),
                        shape: CircleBorder(),
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sellerInfo() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Seller Information",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 30, fontFamily: "Signatra"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                    "See profile",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Signatra",
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 50,
                              height: 50,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/profile.jpg")))),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            "lmquannn",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 22, fontFamily: "Signatra"),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Color(0xFFE82D3F),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 2, color: Color(0xFFE82D3F))),
                              child: Icon(Icons.favorite,
                                  color: Colors.white, size: 15),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "4.2",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _details() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Details",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 30, fontFamily: "Signatra"),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Condition",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 23, fontFamily: "Signatra"),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 10, 0),
                  child: Text(
                    "New",
                    style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _description() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
              child: Text(
                "Details",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 30, fontFamily: "Signatra"),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: displayWidth(context) - 10,
              padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus neque ut enim congue egestas. Sed id lacus sit amet risus dapibus gravida. Nunc accumsan, sem eget elementum condimentum, nunc odio iaculis mi, et consectetur ante augue ut tellus. Fusce iaculis vitae felis vitae imperdiet. Ut ultricies pellentesque lacus a pharetra. Sed maximus velit non lobortis consequat. Vestibulum eu felis a quam sagittis consequat ut at nulla. Duis rhoncus, tellus at sollicitudin condimentum, tellus libero pharetra lacus, eget accumsan erat massa eget dolor. Aliquam erat enim, volutpat vel est a, tempus euismod tellus. ",
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(fontSize: 18, fontFamily: "Signatra"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _location() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Text(
                "Location",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 30, fontFamily: "Signatra"),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: displayWidth(context) - 20,
              child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/googleMapPlaceholder.png")),
            ),
          ],
        ),
      ],
    );
  }

  final List<Widget> imageSliders = imageUrl
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1500.0,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}
