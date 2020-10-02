import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int selectRadioButton;

  @override
  void initState() {
    super.initState();
    selectRadioButton = 0;
  }

  setSelectRadio(int val) {
    setState(() {
      selectRadioButton = val;
    });
  }

  List<String> categoryNames = ['Shoes', 'Shirt', 'Pants'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "New Post",
            style: TextStyle(fontFamily: "sans-serif", fontSize: 21),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  print("post");
                },
                child: Text(
                  "Share",
                  style: TextStyle(
                      fontFamily: "sans-serif", fontSize: 21, color: Colors.blue),
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/117371554_1755573607935308_8197164823030729470_n.jpg?_nc_cat=100&_nc_sid=85a577&_nc_ohc=t-sA4ua99xcAX8F1fHS&_nc_ht=scontent.fvca1-2.fna&oh=493806a7c818def763ef0ff27bb2b4c3&oe=5F69E370'),
                            )),
                      ),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Write description',
                              hintStyle: TextStyle(color: Colors.grey)),
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(40, 10, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Brand name',
                        style: TextStyle(fontSize: 19, fontFamily: "sans-serif"),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          child: TextField())
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(40, 10, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Address',
                        style: TextStyle(fontSize: 19, fontFamily: "sans-serif"),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          child: TextField())
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(40, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 19, fontFamily: "sans-serif"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.attach_money),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(40, 10, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Condition',
                        style: TextStyle(fontSize: 19, fontFamily: "sans-serif"),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  'New',
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: "sans-serif"),
                                ),
                                leading: Radio(
                                  value: 1,
                                  groupValue: selectRadioButton,
                                  activeColor: Colors.blue,
                                  onChanged: (val) {
                                    print(val);
                                    setSelectRadio(val);
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Used',
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: "sans-serif"),
                                ),
                                leading: Radio(
                                  value: 2,
                                  groupValue: selectRadioButton,
                                  activeColor: Colors.blue,
                                  onChanged: (val) {
                                    print(val);
                                    setSelectRadio(val);
                                  },
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(40, 10, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Category',
                        style: TextStyle(fontSize: 19, fontFamily: "sans-serif"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                          ),
                          child: DropdownButton(
                            items: categoryNames
                                .map((value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (value) {},
                            isExpanded: true,
                            value: categoryNames.first,
                            icon: Icon(Icons.arrow_drop_down_circle),
                            underline: Container(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(40, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Size',
                        style: TextStyle(fontSize: 19, fontFamily: "sans-serif"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(40, 10, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Type of post',
                        style: TextStyle(fontSize: 19, fontFamily: "sans-serif"),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  'Want to buy',
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: "sans-serif"),
                                ),
                                leading: Radio(
                                  value: 1,
                                  groupValue: selectRadioButton,
                                  activeColor: Colors.blue,
                                  onChanged: (val) {
                                    print(val);
                                    setSelectRadio(val);
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Want to sell',
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: "sans-serif"),
                                ),
                                leading: Radio(
                                  value: 2,
                                  groupValue: selectRadioButton,
                                  activeColor: Colors.blue,
                                  onChanged: (val) {
                                    print(val);
                                    setSelectRadio(val);
                                  },
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
