import 'package:flutter/material.dart';
import 'package:daltonismo/src/Vista/Pruebas/Pruebas.dart';
import 'package:daltonismo/src/Vista/Pruebas/Mostrar.dart';
import 'package:provider/provider.dart';

import '../../Control/Firebase/Autentificacion.dart';
import '../../Modelo/PruebasModel.dart';
import '../menuLateral.dart';

class EstructuraProducto extends StatefulWidget {
  @override
  _EstructuraProductoState createState() => _EstructuraProductoState();
}

class _EstructuraProductoState extends State<EstructuraProducto> {
  var correo;
  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<Autentificacion>(context);
    correo = authService.user?.email;
    return Scaffold(
        appBar: AppBar(
            title: Text('Productos'),
            centerTitle: true,
            backgroundColor: Color(0xFF11253c)),
        drawer: MenuLateral(),
        body: new SingleChildScrollView(child: panel(context)));
  }

  Widget panel(BuildContext context) {
    return Container(
        color: Color(0xFF333742),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [botonAgregar(), botonMostrar()],
        )));
  }

  Widget botonAgregar() {
    return Container(
        width: 200,
        padding: EdgeInsets.only(top: 30),
        /*child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),*/
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 17, 37, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            'Agregar un nuevo producto',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => articulos()),
            );
          },
        ));
  }

  Widget botonMostrar() {
    return Container(
        width: 200,
        padding: EdgeInsets.only(top: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 17, 37, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            'Mis producto',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            /*List<productosM> productos =
                await ProductosService().getProducto(correo);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MostrarProductos(productos)),
            );*/
          },
        ));
  }
}
