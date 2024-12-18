import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
//Importamos la estructura de bienvenida
import '../InicioSesion/estructura.dart';

class Bienvenida {
  Widget animacion() {
    return AnimatedSplashScreen(
      splashIconSize: 350,
      duration: 1000,
      splash: 'asset/LogoCBN.png', //aqui va el asset del Logo
      nextScreen: Estructura(),
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
