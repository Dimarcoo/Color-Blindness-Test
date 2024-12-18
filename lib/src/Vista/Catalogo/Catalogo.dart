import 'package:flutter/material.dart';
import 'package:daltonismo/src/Vista/MenuCasa.dart';

import '../../Modelo/auxPruebas.dart';
import '../Propiedades/Propiedades.dart';
import '../menuLateral.dart';

class Catalogo extends StatelessWidget {
  final boxBuscar = TextEditingController();

  //Filtrar
  List<auxPruebas> listProductos = [
    auxPruebas(
        "TEST DE ISHIAHARA",
        "La prueba de Ishihara es una prueba de detección de daltonismo, también conocida como prueba de los colores de Ishihara. Fue desarrollada por el médico japonés Shinobu Ishihara y consta de una serie de placas de colores diseñadas para evaluar la capacidad de una persona para percibir y distinguir los colores.",
        "asset/Lamina_2.png"),
    auxPruebas(
        "PRUEBA DE FARNSWORTH 100 HUE",
        "Esta prueba evalúa la capacidad de una persona para ordenar y distinguir diferentes tonos de colores.",
        "asset/Munsell.jpg"),
    auxPruebas(
        "PRUEBA DE COLOR DE ANOMALOSCOPIO",
        "La prueba de color del anomaloscopio es un método utilizado para evaluar la visión de color y la capacidad de distinguir diferentes tonos.",
        "asset/noma.png"),
    auxPruebas(
        "PRUEBA DE COLOR DE CAMBRIDGE",
        "Este test es un examen comúnmente utilizado para evaluar la capacidad de una persona para percibir los colores correctamente y detectar ciertos tipos de daltonismo, como la deficiencia de visión rojo-verde.",
        "asset/camb.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Pruebas'),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000)),
        drawer: MenuLateral(),
        body: SingleChildScrollView(child: home(context)));
  }

  Widget home(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(156, 222, 140, 30), //color del menú
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            campoBusqueda(),
            listaProducto(context),
            menuCasa().campoCasa(context)
          ],
        )));
  }

  Widget listaProducto(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Container(
          height: 535,
          child: ListView(
            children: generateItem(context),
            addAutomaticKeepAlives: false,
            scrollDirection: Axis.vertical,
          )),
    );
  }

  Widget campoBusqueda() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: TextField(
            controller: boxBuscar, decoration: decoracion("Buscar prueba")));
  }

  decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        filled: true,
        fillColor: Colors.white, //BUSCADOR
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ));
  }

  List<Widget> generateItem(context) {
    final list = <Widget>[];
    int count = 1;

    if (listProductos.length % 2 != 0) {
      listProductos.add(auxPruebas("nombre", "caracteristicas", "imagen"));
    }
    for (int i = 0; i < (listProductos.length / 2); i++) {
      list.add(articulos(
          context,
          listProductos.elementAt(i + i).imagen,
          listProductos.elementAt(count).imagen,
          listProductos.elementAt(i + i).nombre,
          listProductos.elementAt(count).nombre,
          listProductos.elementAt(i + i).caracteristicas,
          listProductos.elementAt(count).caracteristicas,
          i + i,
          count));
      //Separa las Columnas
      list.add(Divider());
      count += 2;
    }
    return list;
  }

  Widget articulos(context, imagen, imagen2, nombre, nombre2, caracteristicas,
      caracteristicas2, index, index2) {
    return Padding(
        padding: EdgeInsets.only(top: 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          producto(context, imagen, nombre, caracteristicas, index),
          producto(context, imagen2, nombre2, caracteristicas, index2)
        ]));
  }

  producto(context, imagenp, nombrep, caracteristicas, index) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              gradient: LinearGradient(
                  //colors: [Color(0XFF535b67), Color(0xFF454d5a)],
                  //Color de los cuadros de los productos
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromRGBO(159, 255, 232, 1.000)
                  ],
                  begin: Alignment(0.0, 0.0),
                  end: Alignment(0.0, 0.9))),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Propiedades(listProductos, index)),
                );
              },
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(imagenp),
              )),
        ),
        Container(
            decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            width: 150,
            height: 50,
            child: Text(
              nombrep,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ))
      ],
    );
  }
}
