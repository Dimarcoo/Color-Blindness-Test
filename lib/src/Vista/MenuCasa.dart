import 'package:flutter/material.dart';
/*import 'package:dimarcos/src/Vista/Catalogo/catalogo.dart';
import 'package:dimarcos/src/Vista/Compras/compras.dart';*/
import 'package:daltonismo/src/Vista/Usuario/EstructuraUsuario.dart';
import 'package:daltonismo/src/Vista/Catalogo/Catalogo.dart';

class menuCasa {
  Widget campoCasa(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [datosCasa(context), datosPersonales(context)],
      ),
    );
  }

  Widget datosCasa(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Icon(
            Icons.home,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Catalogo()),
            );
          },
        ));
  }

  Widget datosPersonales(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => estructura()),
            );
            //Navigator.of(context).pushNamed(estructura(), user);
          },
          child: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ));
  }
}
