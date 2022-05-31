import 'dart:async';

import 'package:control_escuela/consultas/consultasBDApp.dart';
import 'package:control_escuela/paginas/campos.dart';
import 'package:flutter/material.dart';

class agregarDosente extends StatefulWidget {
  const agregarDosente({ Key? key }) : super(key: key);

  @override
  State<agregarDosente> createState() => _agregarDosenteState();
}

class _agregarDosenteState extends State<agregarDosente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: baseRCalificacion(context),
    );
  }

  final controlerDocente_nombre=TextEditingController();
  final controlerDocente_direccion=TextEditingController();
  final controlerDocente_apellido=TextEditingController();
  final controlerDocente_clave=TextEditingController();
  final controlerDocente_correo=TextEditingController();
  final controlerDocente_fecha_Nacimiento=TextEditingController();
  final controlerDocente_id_tipo_usuario=TextEditingController();
  final controlerDocente_telefon=TextEditingController();
  final controlerDocente_usuario=TextEditingController();

  Widget baseRCalificacion(BuildContext context){


    final _keyForm=GlobalKey<FormState>();
    late BD bd=new BD();
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
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("agregar docente", style: TextStyle(fontSize: 30),),
                  camposDosentes(context, controlerDocente_nombre, controlerDocente_direccion, controlerDocente_apellido, controlerDocente_clave, controlerDocente_correo, controlerDocente_fecha_Nacimiento, controlerDocente_id_tipo_usuario, controlerDocente_telefon, controlerDocente_usuario),
                  SizedBox(
                    height: 30,
                  ),
                  botonGuardarNuevoDocente(context, controlerDocente_nombre, controlerDocente_direccion, controlerDocente_apellido, controlerDocente_clave, controlerDocente_correo, controlerDocente_fecha_Nacimiento, controlerDocente_id_tipo_usuario, controlerDocente_telefon, controlerDocente_usuario),
                  SizedBox(
                    height: 10,
                  ),
                  botonCancelar(context,"cancelar"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.controlerDocente_apellido.dispose();
    this.controlerDocente_clave.dispose();
    this.controlerDocente_correo.dispose();
    this.controlerDocente_direccion.dispose();
    this.controlerDocente_fecha_Nacimiento.dispose();
    this.controlerDocente_id_tipo_usuario.dispose();
    this.controlerDocente_nombre.dispose();
    this.controlerDocente_telefon.dispose();
    this.controlerDocente_usuario.dispose();
  }
}