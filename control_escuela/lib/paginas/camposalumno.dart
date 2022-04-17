import 'package:control_escuela/paginas/menu.dart';
import 'package:flutter/material.dart';

Widget nombreTituloReg() {
    return Text("Registrar alumnos",
    style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
  );
}

Widget campoNombre() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Nombre alumno", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget campoEdad() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Colocar edad del alumno", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget botonRegresarPrincipal(context) {
  return ElevatedButton(
    child: Text("Regresar"),
    onPressed: () {
      Navigator.push(context, 
                MaterialPageRoute(builder: (context) => menuapp()));
  
    }, 
  );
}

Widget campoGenero() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Genero del alumno", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget campoNombreTutor() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Nombre de tutor o responsable", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget campoNameSalon() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Nombre del salon", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget botonGuardar(context) {
  return ElevatedButton(
    child: Text("Guardar cambios"),
    onPressed: () {
      Navigator.push(context, 
                MaterialPageRoute(builder: (context) => menuapp()));
  
    }, 
  );
}
