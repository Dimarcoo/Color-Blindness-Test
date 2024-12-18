import 'package:flutter/material.dart';
import 'package:daltonismo/src/Control/Mensajes/mensajes.dart';
import 'package:provider/provider.dart';
import 'package:daltonismo/src/Vista/Catalogo/Catalogo.dart';
//BD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:daltonismo/src/Control/Firebase/Autentificacion.dart';

class Capa2 {
  var boxUsuario;
  var boxContrasena;
  var authService;

  Capa2(this.boxUsuario, this.boxContrasena);
  //Campo del usuario
  /*Widget campoUsuario() {
    return Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
        child: TextField(
            controller: boxUsuario, decoration: decoracion("Usuario")));
  }*/
  Widget campoUsuario() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
      child: TextField(
        controller: boxUsuario,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: 'Usuario',
        ),
      ),
    );
  }

  //Fin del campo del usuario
  //Inicio campo de contraseña
  /*Widget campoContrasena() {
    return Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxContrasena,
            obscureText: true,
            decoration: decoracion("Contraseña")));
  }*/
  Widget campoContrasena() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
      child: TextField(
        controller: boxContrasena,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.key),
          hintText: 'Usuario',
        ),
        obscureText: true,
      ),
    );
  }

  //Final del campo de contraseña
  //Boton Inicio
  Widget botonInicio(BuildContext context) {
    return Container(
        width: 150,
        padding: const EdgeInsets.only(top: 80),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(42, 194, 213, 1.000),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))), //fin de Style
          onPressed: () async {
            authService = Provider.of<Autentificacion>(context, listen: false);
            if (await authService.signIn(boxUsuario.text, boxContrasena.text) ==
                true) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Catalogo()));
            }
          }, //fin onPressed
          child: const Text(
            'Iniciar Sesion',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ));
  }

  //Fin de boton inicio
  //Inicio Recuperar Contraseña
  Widget recuperarContrasena(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 5),
      child: TextButton(
          onPressed: () async {
            Mensaje().info('Trabajando...');
            //Verificar documentación para el metodo de recuperar contraseña
          },
          child: const Text("¿Olvido su contraseña?",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
    );
  }

  //Fin Recuperar contraseña
  //inicio Label Mensaje
  Widget labelMensaje() {
    return const Padding(
        padding: EdgeInsets.only(left: 50, right: 50, top: 15),
        child: Text(
          "Registarse con: ",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ));
  }

  //Fin Label Mensaje
  //LogoGoogle
  Widget logoGoogle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(),
      width: 50,
      child: TextButton(
        onPressed: () async {
          authService = Provider.of<Autentificacion>(context, listen: false);
          User? user = await authService.iniciarSecionGmail(context: context);
          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Catalogo()));
          }
        },
        child: const Image(
          fit: BoxFit.fill,
          image: AssetImage("asset/google.png"),
        ),
      ),
    );
  }

  //Fin Logo Google
  //Inicio Logo Facebook
  Widget logoFacebook(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(),
      width: 50,
      child: TextButton(
        onPressed: () async {},
        child: const Image(
          fit: BoxFit.fill,
          image: AssetImage("asset/facebook.png"),
        ),
      ),
    );
  }

  //Fin Logo Facebook
  //redes
  Widget redes(context) {
    return Padding(
        padding: const EdgeInsets.only(),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [logoGoogle(context), logoFacebook(context)]));
  }

  //fin redes
  //metodo de decoración
  decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 3, color: Color.fromRGBO(42, 194, 213, 1.000)),
            borderRadius: BorderRadius.circular(15)));
  }
}
