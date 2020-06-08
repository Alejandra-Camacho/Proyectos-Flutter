import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Avatar Page'),
        
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://laverdadnoticias.com/__export/1575833215339/sites/laverdad/img/2019/12/08/este_es_el_primer_poster_de_wonder_woman_1984_1_jpg_793492074_1.jpg_423682103.jpg'),
              radius: 22.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only( right: 10.0 ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            )

          )
        ],
      ),

      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'), 
          fadeInDuration: Duration( milliseconds: 200 ),
          image: NetworkImage('https://cnet4.cbsistatic.com/img/zbqeVL8U5G-BFfAy83Yx1er-liM=/980x551/2017/05/31/b3eeb962-b471-4ab3-991e-b1a92d29ac80/wonder-woman-2017-1.jpg'),
        )
      ),
    );
  }
}