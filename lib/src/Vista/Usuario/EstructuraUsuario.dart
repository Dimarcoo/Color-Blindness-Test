//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:daltonismo/src/Control/Firebase/Autentificacion.dart';
import 'package:daltonismo/src/Modelo/UsuarioModel.dart';
import 'package:daltonismo/src/Vista/MenuCasa.dart';
import 'package:provider/provider.dart';

import '../../Control/Firebase/Usuario_Service.dart';

class estructura extends StatefulWidget {
  @override
  _estructuraState createState() => _estructuraState();
}

class _estructuraState extends State<estructura> {
  final boxNombre = TextEditingController();
  final boxContrasena = TextEditingController();
  final boxDireccion = TextEditingController();
  final boxCorreo = TextEditingController();
  final boxTelefono = TextEditingController();

  var imagenUsuario;
  var nombreUsuario;
  var correoUsuario;

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<Autentificacion>(context);
    imagenUsuario = authService.user?.photoURL;
    nombreUsuario = authService.user?.displayName;
    correoUsuario = authService.user?.email;
    print(authService.user?.photoURL);
    return Scaffold(
        appBar: AppBar(
          title: const Text('MI PERFIL'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(child: panel(context)));
  }

  Widget panel(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(159, 255, 232, 1.000),
        child: Column(
          children: [
            imagenPerfil(context),
            campoNombre(),
            campoEmail(),
            campoTelefono(),
            campoDireccion(),
            campoContrasena(),
            botonGuardar(context),
            botonMostrar(context),
            menuCasa().campoCasa(context)
          ],
        ));
  }

  Widget imagenPerfil(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: imagenUsuario != null
                      ? NetworkImage(imagenUsuario) as ImageProvider
                      : AssetImage('asset/login.png'))),
        ));
  }

  Widget campoNombre() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxNombre, decoration: decoracion(nombreUsuario)));
  }

  Widget campoEmail() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
          controller: boxCorreo,
          decoration: decoracion(correoUsuario),
          enabled: false,
        ));
  }

  Widget campoTelefono() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxTelefono, decoration: decoracion("Telefono")));
  }

  Widget campoDireccion() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxDireccion, decoration: decoracion("Dirreccion")));
  }

  Widget campoContrasena() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxContrasena, decoration: decoracion("Contraseña")));
  }

  Widget botonGuardar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, right: 50, left: 50),
        child: Align(
            child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                    width: 5, color: Color.fromRGBO(159, 255, 232, 1.000)),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () async {
            ProfileService().usuarioAdd(UsuarioModel('nombre2', 'apellido',
                'telefono', 'direccion', 'correo2', 'contrasena'));
          },
          child: const Text(
            "Guardar",
            style: TextStyle(
                fontSize: 15, color: Color.fromRGBO(159, 255, 232, 1.000)),
          ),
        )));
  }

  Widget botonMostrar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, right: 50, left: 50),
        child: Align(
            child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                    width: 5, color: Color.fromRGBO(159, 255, 232, 1.000)),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(159, 255, 232, 1.000)),
          ),
          onPressed: () async {
            print('object');
            UsuarioModel usi =
                await ProfileService().usuarioGet(email: 'correo2');
            if (usi != null) {
              print(usi.nombre);
            }
          },
          child: const Text(
            "Ver",
            style: TextStyle(
                fontSize: 15, color: Color.fromRGBO(159, 255, 232, 1.000)),
          ),
        )));
  }

  Widget getUsu() {
    return FutureBuilder(
        future: ProfileService().usuarioGet(email: 'correo2'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            UsuarioModel usi = snapshot.data as UsuarioModel;
            print(usi.nombre);
          } else {
            print('222');
          }
          return CircularProgressIndicator();
        });
  }

  decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.black26),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ));
  }
}
