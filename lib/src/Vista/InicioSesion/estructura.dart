import 'package:flutter/material.dart';
import 'capa_1.dart';
import 'capa_2.dart';
import 'capa_3.dart';

class Estructura extends StatefulWidget {
  //const Estructura({Key? key}) : super(key: key);
  @override
  _EstructuraState createState() => _EstructuraState();
}

class _EstructuraState extends State<Estructura> {
  final boxCorreo = TextEditingController();
  final boxContrasena = TextEditingController();
  final boxConfirmar = TextEditingController();
  String nombre = "c2";
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio Sesión'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(child: panel(context)));
  }

  //Inicio Widget Panel
  Widget panel(BuildContext context) {
    return Container(
        child: Column(
      children: [primeraCapa(context), lista(context)[indice]],
    ));
  }

  //Final Widget Panel
  //Inicio primera capa
  Widget primeraCapa(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Capa1().logo(), subCapa(context)],
      )),
      decoration: BoxDecoration(
          //Color primera capa
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              //color: const Color.fromRGBO(159, 255, 232, 1.000),
              color: const Color.fromRGBO(159, 255, 232, 1.000),
              offset: new Offset(0, 3),
              blurRadius: 30,
            )
          ]),
    );
  }

  //Final primera capa
  //Inicio Segunda capa
  Widget segundaCapa(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Capa2(boxCorreo, boxContrasena).campoUsuario(),
        Capa2(boxCorreo, boxContrasena).campoContrasena(),
        Capa2(boxCorreo, boxContrasena).botonInicio(context),
        Capa2(boxCorreo, boxContrasena).recuperarContrasena(context),
        Capa2(boxCorreo, boxContrasena).labelMensaje(),
        Capa2(boxCorreo, boxContrasena).redes(context),
      ],
      //añadir capa de Background
    )));
  }

  //Final  Segunda capa
  //Inicio tercera capa
  Widget terceraCapa(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Capa3(boxCorreo, boxContrasena, boxConfirmar).campoCorreo(),
        Capa3(boxCorreo, boxContrasena, boxConfirmar).campoContrasena(),
        Capa3(boxCorreo, boxContrasena, boxConfirmar).campoConfirmar(),
        Capa3(boxCorreo, boxContrasena, boxConfirmar).botonRegistrar(context),
      ],
    )));
  }

  //Final tercera capa
  //Inicio Lista
  List<Widget> lista(context) {
    final list = <Widget>[];
    list.add(segundaCapa(context));
    list.add(terceraCapa(context));
    return list;
  }

  //Final Lista
  //Inicio subcapa
  Widget subCapa(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        botones(context, "INICIO", Alignment.bottomLeft),
        botones(context, "REGISTRAR", Alignment.bottomRight)
      ],
    );
  }

  //Final subcapa
  //Inicio Botones
  Widget botones(BuildContext context, titulo, alineacion) {
    return Padding(
        padding: const EdgeInsets.only(top: 80, right: 60, left: 60),
        child: Align(
            alignment: alineacion,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(
                      width: 5, color: Color.fromRGBO(42, 194, 213, 1.000)),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () async {
                if (titulo == "INICIO") {
                  setState(() {
                    indice = 0;
                  });
                } else if (titulo == "REGISTRAR") {
                  setState(() {
                    indice = 1;
                  });
                }
              },
              child: Text(
                titulo,
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
            )));
  }
  //Final Botones
}
