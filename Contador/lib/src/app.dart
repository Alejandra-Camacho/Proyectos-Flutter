import 'package:flutter/material.dart';
import 'package:contador/src/pages/contador_page.dart';

class MyApp extends StatelessWidget {
	
	@override
	Widget build( BuildContext context ) { //contex contienen la información del arbol de widgets
		return MaterialApp( 
      debugShowCheckedModeBanner: false,
			home: Center(
					// child: HomePage(),
          child: ContadorPage(),
				) 
			
		);
	}

}