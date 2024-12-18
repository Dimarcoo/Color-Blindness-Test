import 'package:flutter/material.dart';
import 'package:daltonismo/src/Control/Mensajes/mensajes.dart';
import 'package:daltonismo/src/Control/Firebase/Autentificacion.dart';

class Capa3 {
  var boxCorreo;
  var boxContrasena;
  var boxConfirmar;
  Capa3(this.boxCorreo, this.boxContrasena, this.boxConfirmar);

  //Inicio campo correo
  Widget campoCorreo() {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: TextField(
          controller: boxCorreo,
          keyboardType: TextInputType.emailAddress,
          //decoration: decoracion("Email"),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.mail_outline),
            hintText: 'Email',
          ),
        ));
  }

  //Fin campo de correo
  //Inicio campo Contraseña
  Widget campoContrasena() {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
          controller: boxContrasena,
          obscureText: true,
          //decoration: decoracion("Contraseña"),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.key),
            hintText: 'Contraseña',
          ),
        ));
  }

  //Fin campo contraseña
  //Inicio campo Confirmar
  Widget campoConfirmar() {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
          controller: boxConfirmar,
          obscureText: true,
          //decoration: decoracion("Coonfirmar contraseña"),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.key),
            hintText: 'Coonfirmar contraseña',
          ),
        ));
  }

  //Fin campo confirmar
  //Inicio boton Registrar
  Widget botonRegistrar(BuildContext context) {
    return Container(
        width: 150,
        padding: const EdgeInsets.only(top: 50),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () async {
              if (boxCorreo.text != '' &&
                  boxContrasena.text != '' &&
                  boxConfirmar.text != '') {
                if (validarEmail(boxCorreo.text)) {
                  if (boxContrasena.text == boxConfirmar.text) {
                    if (!await Autentificacion()
                        .crearUsuario(boxCorreo.text, boxContrasena.text)) {
                      Mensaje().info('Compruebe su conexion');
                    } else {
                      Mensaje().info('Cuenta creada');
                      limpiar();
                    }
                  } else {
                    Mensaje().info('No coiciden las cotraseña');
                  }
                } else {
                  Mensaje().info('Correo no valido');
                }
              } else {
                Mensaje().info("campos vacios");
              }
            },
            child: const Text('Registrarme',
                style: TextStyle(fontSize: 15, color: Colors.white))));
  }

  //Fin boton Registrar
  //Inicio decoración
  /*decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 2, color: Color.fromRGBO(42, 194, 213, 1.000)),
            borderRadius: BorderRadius.circular(30)));
  }*/

  //Fin decoración
  //Inicio campos vacios
  camposVacios() {
    boxCorreo.text.isNotEmpty && boxContrasena.text.isNotEmpty;
  }

  //Fin campos vacios
  //Inicio Limpiar
  limpiar() {
    boxCorreo.text = '';
    boxContrasena.text = '';
    boxConfirmar.text = '';
  }

  //Fin Limpiar
  //Inicio Validación Email
  bool validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
  //Fin validación Email
}
