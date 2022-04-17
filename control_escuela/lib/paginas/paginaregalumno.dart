import 'package:control_escuela/paginas/camposalumno.dart';
import 'package:flutter/material.dart';

class pagina extends StatelessWidget {
  const pagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BIENVENIDO A REGISTRO DE ALUMNOS"),
      ),
      body: ContenidoRegAlumno(context)
      /*Column(
        children: [
          Text("HOLA1"),
          Text("HOLA2"),
        ],
      ),
      */
    );
  }
}

Widget ContenidoRegAlumno(context) {
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
                  nombreTituloReg(),
                  campoNombre(), 
                  campoEdad(),
                  campoGenero(),
                  campoNombreTutor(),
                  campoNameSalon(),
                  botonGuardar(context),
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