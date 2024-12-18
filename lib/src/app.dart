import 'package:flutter/material.dart';
import 'package:daltonismo/src/Vista/Bienvenida/bienvenida.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color.fromRGBO(42, 194, 213, 1.000),
      home: Center(
        child: Bienvenida().animacion(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
