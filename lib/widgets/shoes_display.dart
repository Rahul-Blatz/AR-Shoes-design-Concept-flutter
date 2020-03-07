import 'package:flutter/material.dart';
import 'package:shoe_app/models/shoe_models.dart';

class ShoesDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 200.0,
//      color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: shoes.length,
              itemBuilder: (BuildContext context, int index){
                Shoes shoe = shoes[index];
                return Container(
                  padding: EdgeInsets.only(right: 30.0,left: 30.0),
                  child: Image(
                    image: AssetImage(shoe.imageurl),
                    fit: BoxFit.cover,
                  ),
                );
              }),
        ),
        SizedBox(height: 30.0,),
        Center(
            child: Text(
              'Balenciaga',
              style: TextStyle(
                letterSpacing: 0.0,
                fontFamily:'Muli',
                fontWeight: FontWeight.bold,
                fontSize: 28.0
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.only(top:6.0),
          child: Text('Triple S low-top trainers',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Muli',
            fontWeight: FontWeight.w400,
            color: Colors.grey
          ),),
        )
      ],
    );
  }
}