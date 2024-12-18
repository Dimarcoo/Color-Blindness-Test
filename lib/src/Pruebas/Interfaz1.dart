import 'package:flutter/material.dart';
import 'package:daltonismo/src/Vista/Ishihara/Quiz.dart';

class Prueba extends StatelessWidget {
  const Prueba({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Blindness Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a Color Blindness Test',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presione el botón
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizPage()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.blue, // Cambia aquí el color del borde
                    width: 2, // Cambia aquí el ancho del borde
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                child: Text(
                  'Presiona aquí', // Cambia aquí el texto del botón
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
