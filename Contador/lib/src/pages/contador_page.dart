// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  	
	@override
  	State<StatefulWidget> createState() {
		return _ContadorPageState();
  	}

}

//Estado de la clase ContadorPage
class _ContadorPageState extends State<ContadorPage> {
	
	final _estiloTexto = new TextStyle( fontSize: 25 );
	int _conteo = 0;
	
	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text('Stateful'),
				centerTitle: true
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text('Número de Taps:', style: _estiloTexto),
						Text('$_conteo', style: _estiloTexto),
					]
				)
			),
			// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
			floatingActionButton: _crearBotones(),
		);
  	}

	Widget _crearBotones() {
		
		return Row(
			mainAxisAlignment: MainAxisAlignment.end,
			children: <Widget>[
				SizedBox( width: 30.0),
				FloatingActionButton(
					child: Icon( Icons.exposure_zero ), 
					onPressed: _reset
				),
				Expanded(child: SizedBox()),
				FloatingActionButton(
					child: Icon( Icons.remove ), 
					onPressed: _sustraer
				),
				SizedBox( width: 10.0),
				FloatingActionButton(
					child: Icon( Icons.add ), 
					onPressed: _agregar
				)
			],
		); 
	}

	void _agregar() {
		setState(() => _conteo++ );
	}

	void _reset() {
		setState(() => _conteo = 0 );
	}	

  	void _sustraer() {
		setState(() => _conteo-- );
	}
}