import 'package:flutter/material.dart';
import 'package:daltonismo/src/Vista/Ishihara/Quiz.dart';

import 'package:daltonismo/src/Modelo/auxPruebas.dart';

class Propiedades extends StatelessWidget {
  List<auxPruebas> descriProducto;
  int index;

  Propiedades(this.descriProducto, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DESCRIPCIÓN'),
          backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000),
          centerTitle: true,
        ),
        body: home(context));
  }

  Widget home(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(159, 255, 232, 1.000),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [titulo(), contenedor(context)],
        ));
  }

  Widget titulo() {
    return Container(
        height: 110,
        padding: EdgeInsets.only(),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              descriProducto.elementAt(index).nombre,
              style: TextStyle(color: Colors.black, fontSize: 30),
            )));
  }

  Widget contenedor(BuildContext context) {
    return Expanded(
        child: Container(
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              children: [
                fondoImagen(),
                propiedadProductos(),
                campoPropiedades(context)
              ],
            )));
  }

  Widget fondoImagen() {
    return Expanded(
      child: Container(
          child: Image(
        // fit: BoxFit.fill,
        image: AssetImage(descriProducto.elementAt(index).imagen),
      )),
    );
  }

  Widget propiedadProductos() {
    return Container(
      height: 250,
      alignment: Alignment.centerLeft,
      child: Column(children: [
        descripcion(),
      ]),
    );
  }

  Widget descripcion() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            descriProducto.elementAt(index).caracteristicas,
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
    );
  }

  Widget campoPropiedades(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(42, 194, 213, 1.000),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [iniciarprueba(context)],
      ),
    );
  }

  Widget iniciarprueba(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(159, 255, 232, 1.000),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizPage()),
            );
          },
        ));
  }
}
