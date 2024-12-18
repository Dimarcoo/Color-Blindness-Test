import 'package:flutter/material.dart';
import 'package:daltonismo/src/Control/Mensajes/mensajes.dart';
//import 'package:daltonismo/src/Control/Mensajes/mensajes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Autentificacion with ChangeNotifier {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  //final usuario
  User? user;
  //Constructor
  Autentificacion({FirebaseAuth? auth, GoogleSignIn? googleSignIn})
      : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();
  //Inicio  del metodo iciar sesión con cuenta de Google
  Future<User?> iniciarSecionGmail({required BuildContext context}) async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        user = userCredential.user;
        notifyListeners();
        return user;
      } on FirebaseAuthException {
        print("error en la autentificacion");
        return null;
      }
    }
    return null;
  }

  //Final del metodo iniciar sesion con cuenta de Google
  //Inicio para crear un nuevo usuario
  Future<bool> crearUsuario(email, password) async {
    try {
      final persona = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (persona.user != null) {
        final usuario = _auth.currentUser;
        usuario?.sendEmailVerification();
        Mensaje().info("Se envio un enlace de coonfirmación al correo");
        return true;
      } else {
        print(persona.toString() + "si esta");
        return false;
      }
    } on FirebaseAuthException {
      return false;
    }
  }

  //Final de para crear un nuevo usuario
  //Inicio metodo iniciar sesión con correo y contraseña
  Future<bool> signIn(email, password) async {
    try {
      final usuario = _auth.currentUser;
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(usuario?.emailVerified);
      if (user != null && usuario?.emailVerified != null) {
        return true;
      } else {
        Mensaje().info("Coonfirmar correo");
        return false;
      }
    } on FirebaseAuthException {
      return false;
    }
  }

  //Final del metodo inicio de sesión con correo y contraseña
  //Inicio metodo para obtener usuario
  Future<String?> getNombre() async {
    return user?.displayName;
  }

  //Final metodo para obtener usuario
  //Inicio metodo para saber si el usuario esta logueado
  Future<bool> isSignedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  //Final del metodo para saber si el usuario está logueado
  //Inicio metodo para salir de la cuenta
  /*Future<bool> signedOut() async {
    try {
      final currentUser = _auth.signOut();
      return currentUser != null;
    } on FirebaseAuthException {
      return false;
    }
  }*/
  Future<bool> signedOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  User? get usuario => user;
}
