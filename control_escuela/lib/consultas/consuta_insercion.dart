import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:control_escuela/consultas/consulta_busqueda.dart';
import 'package:control_escuela/consultas/consultasBDApp.dart';
import 'package:flutter/material.dart';

class insertar{
  late BD bd=new BD();
  late Busqueda b=new Busqueda();
  Future<int> AgregarDosente(TextEditingController nombre,TextEditingController direccion,TextEditingController apellido,TextEditingController clave,TextEditingController correo,TextEditingController fecha,TextEditingController tipo,TextEditingController telefono,TextEditingController user)async{
    int respuesta=0;
    try {
      await FirebaseFirestore.instance.collection(bd.tabla_docente).doc().set({
        bd.campo_tabla_docente_apellido: apellido.text,
        bd.campo_tabla_docente_clave: clave.text,
        bd.campo_tabla_docente_correo: correo.text,
        bd.campo_tabla_docente_direccion: direccion.text,
        bd.campo_tabla_docente_id_tipo_usuario: tipo.text,
        bd.campo_tabla_docente_nombre: nombre.text,
        bd.campo_tabla_docente_telefon: telefono.text,
        bd.campo_tabla_docente_usuario: user.text,
        bd.campo_tabla_docente_fecha_Nacimiento:"10 oct 1962",
      });
      respuesta=1;
    } catch (e) {
      respuesta=0;
      print(e);
    }
    return respuesta;
  }
}