import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cards')
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox( height: 30.0 ),
            _cardTipo2()
          ]
        ),
      ),
    );
  }
}

_cardTipo1() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
    child: Column(
      children: <Widget>[ 
        ListTile( 
          leading: Icon( Icons.photo_album, color: Colors.blue ),
          title: Text('Soy el titulo de esta tarjeta'),
          subtitle: Text('Aquí estamos con la descripción de la tarjeta que debe de ser lo suficientemente largo para que ustedes entiendan el ejemplo'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {  }, 
              child: Text('Cancelar')
            ),
            FlatButton(
              onPressed: () {  }, 
              child: Text('Ok')
            )
          ]
        ) 
      ]
    ),
  );
}

_cardTipo2() {

  final card = Container(
    child: Column(
      children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/original.gif'), 
          image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2017/03/landscape-photography-tom-archer-2.jpg'),
          fadeInDuration: Duration( milliseconds: 200 ),
          height: 300.0,
          fit: BoxFit.cover
        ),
        // Image(
        //   image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2017/03/landscape-photography-tom-archer-2.jpg'),
        // ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Titulo de la Imagen')
        )
      ]
    ),
  );

  return Container( 
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular( 30.0 ),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0, 8.0)
        )
      ]
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular( 30.0 ),
      child: card
    ),
  );

}