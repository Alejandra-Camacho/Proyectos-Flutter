import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isloading = false;

  @override
  void initState() { 
    super.initState();
    
    _agregar10img();

    _scrollController.addListener( (  ) {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Listas') ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ]
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: ( BuildContext context, int index) {

          final imagen = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/original.gif'),
          );
        }
      
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration( seconds: 2 );
    new Timer( duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10img();
    });

    return Future.delayed(duration);
  }

  void _agregar10img() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }
    setState(() {  });
  }

  Future<Null> _fetchData() async {
    _isloading = true;
    setState(() {  });

    final duration = new Duration( seconds: 2 );
 
    return new Timer( duration, respuestaHTTP );
  }

  void respuestaHTTP() {
    _isloading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: Duration( milliseconds: 250 ), 
      curve: Curves.fastOutSlowIn
    );

    _agregar10img();
  }

  Widget _crearLoading() {
    if ( _isloading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox( height: 15.0 )
        ],
      );
    } else {
      return Container();
    }
  }

}