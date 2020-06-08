import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre             = 'John Doe';
  String _email              = 'john.doe@email.com';
  String _fecha              = '01/01/1999';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes      = ['Volar', 'Rayos X', 'Super Aliento', 'Super fuerza'];


  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Inputs de Texto') ),

      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0 ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      )
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
        border: OutlineInputBorder( borderRadius: BorderRadius.circular( 10.0 ) ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'John Doe',
        labelText: 'Nombre',
        helperText: 'Sólo es un nombre',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),

      onChanged: ( valor ) => setState(() { _nombre = valor; }) 
      
    );
  }
  
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      
      decoration: InputDecoration(
        border: OutlineInputBorder( borderRadius: BorderRadius.circular( 10.0 ) ),
        hintText: 'Correo Electrónico',
        labelText: 'Email',
        helperText: 'john.doe@email.com',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email )
      ),

      onChanged: ( valor ) => setState(() { _email = valor; })

    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
    
      decoration: InputDecoration(
        border: OutlineInputBorder( borderRadius: BorderRadius.circular( 10.0 ) ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        helperText: 'john.doe@email.com',
        suffixIcon: Icon( Icons.lock_open ),
        icon: Icon( Icons.lock )
      ),

      // onChanged: ( valor ) => setState(() { _email = valor; })

    );
  }

  Widget _crearFecha( BuildContext context ) {
    return TextField(
      enableInteractiveSelection: false,

      controller: _inputFieldDateController,

      decoration: InputDecoration(
        border: OutlineInputBorder( borderRadius: BorderRadius.circular( 10.0 ) ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        helperText: 'john.doe@email.com',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today )
      ),

      onTap: () {
        FocusScope.of( context ).requestFocus( new FocusNode() );
        _selecDate( context );
      },

    );
  }

  _selecDate( BuildContext context ) async {
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2015), 
      lastDate: new DateTime(2025),

      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach( ( poder ) {
      lista.add( DropdownMenuItem(
        child: Text( poder ),
        value: poder
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon( Icons.select_all ),
        SizedBox( width: 30.0 ),
        Expanded(
          child: DropdownButton(
            value:  _opcionSeleccionada,
            items: getOpcionesDropdown(), 
            onChanged: ( opt ) { 
              setState(() {
                _opcionSeleccionada = opt;
              });
            }
          ),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

}