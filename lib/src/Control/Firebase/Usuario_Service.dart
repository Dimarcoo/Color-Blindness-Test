import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Modelo/UsuarioModel.dart';

class ProfileService {
  bool isNullOrEmpty(String text) => text == null || text.isEmpty;

//Obtener Usuarios
  usuarioGet({String? email, String? phone}) async {
    //campos bacios
    if (isNullOrEmpty(email!) && isNullOrEmpty(phone!)) {
      return null;
    }
    print('34');
    try {
      //Usuario no existe
      var snapshot;
      if (!isNullOrEmpty(email)) {
        snapshot = await FirebaseFirestore.instance
            .collection('Usuario')
            .where('email', isEqualTo: email)
            .get();
      } else {
        snapshot = await FirebaseFirestore.instance
            .collection('usuario')
            .where('phone', isEqualTo: phone)
            .get();
      }

      if (snapshot.docs.isEmpty) {
        return null;
      }

      if (snapshot.docs.length > 1) {
        print("El usuario ya existe");
      }
      return UsuarioModel.fromSnapshot(snapshot.docs.first);
    } catch (e) {
      print(e);
    }
  }

//Agregar Usuario
  usuarioAdd(UsuarioModel perfil) async {
    try {
      var existente = await usuarioGet(email: perfil.email);
      if (existente != null) {
        return existente;
      }

      await FirebaseFirestore.instance
          .collection('Usuario')
          .add(perfil.toJson());
    } catch (e) {
      print("Usuario no creado");
      print(e);
    }
  }

//Actualizar Usuario
  update(UsuarioModel perfil) async {
    try {
      var existente = await usuarioGet(email: perfil.email);
      if (existente == null) {
        print("El usuario no existe");
        return null;
      }

      await FirebaseFirestore.instance
          .doc(perfil.reference?.path ?? 'fallido')
          .update(perfil.toJson());
    } catch (e) {
      print(e);
    }
  }
}
