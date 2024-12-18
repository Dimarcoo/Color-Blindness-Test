import 'dart:io';

import 'package:flutter/material.dart';
import 'package:daltonismo/src/Control/Mensajes/mensajes.dart';
import 'package:daltonismo/src/Modelo/PruebasModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Control/Firebase/Autentificacion.dart';
import '../menuLateral.dart';

class articulos extends StatefulWidget {
  @override
  _articulosState createState() => _articulosState();
}

class _articulosState extends State<articulos> {
  String dropdownvalue = ' Celulares';

  var imageFile, nombrePath, correoUsuario;
  final ImagePicker _picker = ImagePicker();
  final boxCategoria = TextEditingController();
  final boxNombre = TextEditingController();
  final boxPrecio = TextEditingController();
  final boxCaracteristicas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<Autentificacion>(context);
    correoUsuario = authService.user?.email;
    return Scaffold(
        appBar: AppBar(
            title: Text('Productos'),
            centerTitle: true,
            backgroundColor: Color(0xFF11253c)),
        drawer: MenuLateral(),
        body: new SingleChildScrollView(child: panel(context)));
  }

  Widget panel(BuildContext context) {
    return Container(
        color: Color(0xFF333742),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            nombreProducto(),
            caracteristicasProducto(),
            categoriaProducto(),
          ],
        )));
  }

  Widget nombreProducto() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxNombre,
            decoration: decoracion("Nombre del producto")));
  }

  Widget caracteristicasProducto() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxCaracteristicas,
            decoration: decoracion("caracteristicas del producto")));
  }

  Widget categoriaProducto2() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxCategoria,
            decoration: decoracion("categoria del producto")));
  }

  Widget categoriaProducto() {
    var items = [" Celulares", "Televisores", "Neveras", "Accesorios"];
    return DropdownButton(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
      style: TextStyle(color: Colors.white),
    );
  }

  Widget setImageView() {
    if (imageFile != null) {
      return Image.file(
        File(imageFile),
        height: 300,
      );
    } else {
      return const Image(
        image: AssetImage('asset/lupa.png'),
        height: 300,
      );
    }
  }

  decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ));
  }
}
