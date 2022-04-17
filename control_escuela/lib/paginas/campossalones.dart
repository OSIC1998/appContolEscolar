import 'package:control_escuela/paginas/menu.dart';
import 'package:control_escuela/paginas/paginaeditaddsalon.dart';
import 'package:flutter/material.dart';

Widget nombreTituloSalones() {
    return Text("Administrar salones",
    style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
  );
}

Widget campoSalonA() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Seccion A", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget campoSalonB() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Seccion B", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget campoSalonC() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Seccion C", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget botonCrearSalon(context) {
  return ElevatedButton(
    child: Text("Crear nuevo salón"),
    onPressed: () {
      Navigator.push(context, 
                MaterialPageRoute(builder: (context) => addSalones()));
  
    }, 
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

