import 'package:flutter/material.dart';
import 'package:daltonismo/src/Vista/InicioSesion/estructura.dart';
/*import 'package:dimarcos/src/Vista/Productos/estructura.dart';
import 'package:dimarcos/src/Vista/inicioSesion/estructura.dart';
import 'Catalogo/catalogo.dart';
import 'Compras/compras.dart';*/

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Color.fromARGB(252, 209, 120, 24),
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("COLOR BLINDNESS TEST"),
            accountEmail: Text("cbt@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/LogoApp.png')),
                color: Color.fromRGBO(42, 194, 213, 1.000)),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );*/
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    Text(
                      "Menú",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    )
                  ],
                )),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: TextButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => compras()),
                  );*/
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.card_travel,
                      color: Colors.black,
                    ),
                    Text(
                      "Pruebas",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    )
                  ],
                )),
          ),
          Container(
            padding: const EdgeInsets.only(top: 400),
            child: TextButton(
                onPressed: () async {
                  //if (await Autentificacion().signedOut()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Estructura()),
                  );
                  // }
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    Text(
                      "Salir",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
