import 'package:control_escuela/paginas/campossalones.dart';
import 'package:flutter/material.dart';

class AdminSalones extends StatelessWidget {
  const AdminSalones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BIENVENIDO A SALONES"),
      ),
      body: ContenidoAdminSalon(context)
      /* Column(
        children: [
          Text("HOLA3"),
          Text("HOLA4"),
        ],
      ),
      */
    );  
  }
}

Widget ContenidoAdminSalon(context) {
  return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("imagenes/fondo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  nombreTituloSalones(),
                  campoSalonA(),
                  campoSalonB(),
                  campoSalonC(),
                  botonCrearSalon(context),
                  botonRegresarPrincipal(context)
                ],
              )//Text("Saludos a TODOS"),
              )
          ), 
          ),
        ),
      ),
    );
}