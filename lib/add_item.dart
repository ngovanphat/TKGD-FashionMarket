import 'package:fashion_market/post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
 
  String imageChosing = 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4535b1d1-bc3b-4ef9-91b4-a77fb0332855/air-max-97-essential-shoe-jg3ZQc.jpg';
  Map <String,bool> imageUrlAndChosen = {
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4535b1d1-bc3b-4ef9-91b4-a77fb0332855/air-max-97-essential-shoe-jg3ZQc.jpg' : true,
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b7a618ab-26e8-4fb1-8003-5345a3779609/air-max-97-essential-shoe-jg3ZQc.jpg': false,
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/835c02c6-dcc9-447d-81fe-ccc6ad4f550b/air-max-97-essential-shoe-jg3ZQc.jpg': false,
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e0eec555-e332-470e-8a6b-e86b740562f5/air-max-97-essential-shoe-jg3ZQc.jpg': false,
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/13a9104c-9a55-48db-a07a-c2dafba7d193/air-max-97-essential-shoe-jg3ZQc.jpg': false,
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/753e1ac2-e971-48c6-9d30-73039049850c/air-max-97-essential-shoe-jg3ZQc.jpg': false,
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5b125eb4-ff83-496c-b557-d11cd50adc9c/air-max-97-essential-shoe-jg3ZQc.jpg': false,
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/c8ff0fa6-1bbf-4f52-8de6-15af874a33c4/air-max-97-essential-shoe-jg3ZQc.jpg': false,
  };
  List <String> imageUrl =[
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4535b1d1-bc3b-4ef9-91b4-a77fb0332855/air-max-97-essential-shoe-jg3ZQc.jpg',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/b7a618ab-26e8-4fb1-8003-5345a3779609/air-max-97-essential-shoe-jg3ZQc.jpg',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/835c02c6-dcc9-447d-81fe-ccc6ad4f550b/air-max-97-essential-shoe-jg3ZQc.jpg',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/e0eec555-e332-470e-8a6b-e86b740562f5/air-max-97-essential-shoe-jg3ZQc.jpg',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/13a9104c-9a55-48db-a07a-c2dafba7d193/air-max-97-essential-shoe-jg3ZQc.jpg',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/753e1ac2-e971-48c6-9d30-73039049850c/air-max-97-essential-shoe-jg3ZQc.jpg',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/5b125eb4-ff83-496c-b557-d11cd50adc9c/air-max-97-essential-shoe-jg3ZQc.jpg',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/c8ff0fa6-1bbf-4f52-8de6-15af874a33c4/air-max-97-essential-shoe-jg3ZQc.jpg',
  ];

  Widget imageRender(BuildContext context, String imageUrl, bool isChosen) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: isChosen ? Colors.blue : Colors.white ,width: 1.0)
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if(imageUrlAndChosen[imageUrl] == false) imageChosing = imageUrl;
            imageUrlAndChosen[imageUrl] = !imageUrlAndChosen[imageUrl];
          });
        },
        child: SizedBox(
            height: 100,
            width: (MediaQuery.of(context).size.width-10)/4-15,
            child: Image.network(
              '$imageUrl',
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    alignment: Alignment.bottomRight,
                    decoration:  BoxDecoration(
                       image: DecorationImage(
                          image: NetworkImage('$imageChosing',),
                          fit: BoxFit.cover,
                       ),
                   ),
                  child:  IconButton(
                    icon: Icon(Icons.zoom_in),
                    tooltip: 'Zoom image',
                    color: Colors.black,
                    onPressed: (){
                      print('Zoom in Image');
                    },
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Library',
                        style: TextStyle(
                          fontFamily: "Signatra",
                          fontSize: 20,
                          color: Colors.blue
                        ),
                      ),
                      Text(
                        'Photo',
                        style: TextStyle(
                            fontFamily: "Signatra",
                            fontSize: 20,
                        ),
                      ),
                      Text(
                        'Video',
                        style: TextStyle(
                            fontFamily: "Signatra",
                            fontSize: 20,
                         ),
                      )
                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      imageRender(context, imageUrl[0],imageUrlAndChosen[imageUrl[0]]),
                      imageRender(context, imageUrl[1],imageUrlAndChosen[imageUrl[1]]),
                      imageRender(context, imageUrl[2],imageUrlAndChosen[imageUrl[2]]),
                      imageRender(context, imageUrl[3],imageUrlAndChosen[imageUrl[3]]),
                    ],
                  ),
                ),
                Container(
                 padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        imageRender(context, imageUrl[4],imageUrlAndChosen[imageUrl[4]]),
                        imageRender(context, imageUrl[5],imageUrlAndChosen[imageUrl[5]]),
                        imageRender(context, imageUrl[6],imageUrlAndChosen[imageUrl[6]]),
                        imageRender(context, imageUrl[7],imageUrlAndChosen[imageUrl[7]]),
                      ],
                ),
                ),
                FlatButton(
                  onPressed: (){
                    print("open show more image");
                  },
                  child: Text(
                    'Show more',
                    style: TextStyle(
                      fontFamily: "Signatra",
                      fontSize: 20,
                      color: Colors.blue
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.skip_next),
          color: Colors.white,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostItem()),
            );
          },
        )
      ),
    );
  }
}
