import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shoe_app/widgets/shoes_display.dart';
import 'package:rating_bar/rating_bar.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShoeAppState();
  }
}

class ShoeAppState extends State<MyApp> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  List<double> shoe_sizes = [6,6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12];

  Widget _buildShoeSize(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Container(
          height: 55.0,
          width: 55.0,
          decoration: BoxDecoration(
              color: _selectedIndex == index ? Color(0xff675BBB) : Color(0xffF7F7F6), borderRadius: BorderRadius.circular(20.0)),
          child: Center(
            child: Text(
              shoe_sizes[index].toString(),
              style: _selectedIndex == index ? TextStyle(
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.white):
              TextStyle(
                fontFamily: 'Muli',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isPressed = false;
  double _ratingStar = 0;
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
            color: Color(0xffF7F7F6),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0,),
              child: ListView(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 32.0,
                      onPressed: () {
                        print('Back Pressed');
                      },
                    ),
                    IconButton(
                      icon: new Icon(
                          isPressed ? Icons.favorite : Icons.favorite_border),
                      iconSize: 32.0,
                      color: (isPressed) ? Colors.red : Color(0xff9A9A9A),
                      splashColor: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                    ),
                  ],
                ),
                ShoesDisplay(),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RatingBar(
                      maxRating: 5,
                      emptyIcon: Icons.star,
                      filledIcon: Icons.star,
                      filledColor: Color(0xffFDDC75),
                      emptyColor: Color(0xffececec),
                      size: 18.0,
                      onRatingChanged: (rating) =>
                          setState(() => _ratingStar = rating),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '$_ratingStar',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                    Text(
                      ' / ',
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    Text(
                      '5.0',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ],
                ),
                Center(
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
//                       alignment: WrapAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        child: Center(
                          child: Text(
                            'In 2017, Balenciaga gathered moulds of running, basketball and track',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16.0, fontFamily: 'Muli'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80.0,
                  width: 300.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal ,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: shoe_sizes.asMap().entries.map(
                              (MapEntry map) => _buildShoeSize(map.key),
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0),
                      side: BorderSide(color: Color(0xffFDDC75))
                    ),
                    color: Color(0xffFDDC75),
                    elevation: 0.0,
                    disabledColor: Color(0xffFDDC75),
                    disabledTextColor: Colors.black,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text("Add to cart - \$92.15",
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontSize: 17.0,
                          fontWeight: FontWeight.w900,
                        ),
                        ),
                      ),
                    ),
                    onPressed: ()=> _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text("Added to Cart",
                            style: TextStyle(
                              fontFamily: 'Muli',
                              fontSize: 16.0,
                            ),),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0,left: 20.0,right: 20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      side: BorderSide(color: Colors.grey)
                    ),
                    disabledColor: Color(0xffF7F7F6),
                    disabledTextColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0),
                            child: Icon(Icons.crop_free,size: 30.0,),
                          ),

                          Text('AR view',
                          style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: 16.0
                          ),)
                        ],
                      ),
                    ),
                  ),
                )
              ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
