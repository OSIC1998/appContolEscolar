import 'package:control_escuela/paginas/menu.dart';
import 'package:control_escuela/paginas/paginasalones.dart';
import 'package:flutter/material.dart';

Widget nombreTituloAddSalones() {
    return Text("Administrar salones",
    style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
  );
}

Widget campoNombreSalon() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Nombre del salon", fillColor: Colors.white, filled: true)
   ),
  );
}

Widget campoUbicacion() {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(hintText: "Ubicacion", fillColor: Colors.white, filled: true)
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

Widget botonRegresarPrincipal(context) {
  return ElevatedButton(
    child: Text("Regresar"),
    onPressed: () {
      Navigator.push(context, 
                MaterialPageRoute(builder: (context) => AdminSalones()));
  
    }, 
  );
}

