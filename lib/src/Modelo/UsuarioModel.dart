import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioModel {
  final String nombre;
  final String apellido;
  final String telefono;
  final String direccion;
  final String email;
  final String clave;
  DocumentReference? reference;

//Constructor
  UsuarioModel(
    this.nombre,
    this.apellido,
    this.telefono,
    this.direccion,
    this.email,
    this.clave,
  );

//
  UsuarioModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data.call() as Map<String, dynamic>,
            reference: snapshot.reference);

//
  UsuarioModel.fromMap(Map<String, dynamic> map, {this.reference})
      : nombre = map['nombre'],
        apellido = map['apellido'],
        telefono = map['telefono'],
        direccion = map['direccion'],
        email = map['email'],
        clave = map['clave'];

//
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'direccion': direccion,
      'email': email,
      'clave': clave
    };
  }
}
