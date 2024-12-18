import 'package:flutter/material.dart';
import 'package:daltonismo/src/Control/Firebase/Autentificacion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:daltonismo/src/app.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(ChangeNotifierProvider(
      create: (context) => Autentificacion(),
      child: const MyApp(),
    ));
  });
}
