import 'package:flutter/material.dart';

class Capa1 {
  String nombre = "";
  Widget logo() {
    return const Padding(
      padding: EdgeInsets.only(top: 17.5),
      child: Image(
        image: AssetImage('asset/titulo2.png'),
      ),
    );
  }
}
