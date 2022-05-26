

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:control_escuela/consultas/consulta_busqueda.dart';
import 'package:control_escuela/consultas/consultasBDApp.dart';
import 'package:control_escuela/paginas/campos.dart';
import 'package:flutter/material.dart';


class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _keyForm=GlobalKey<FormState>();
  final controlerU=TextEditingController();
  final controlerP=TextEditingController();
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: baseLogin(context),
    );
  }


  Widget baseLogin(BuildContext context){
    return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage("imagenes/fondo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 200, 20, 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    camposGeneral("Ususario", controlerU),
                    SizedBox(
                      height: 10,
                    ),
                    camposPass("Password", controlerP),
                    SizedBox(
                      height: 30,
                    ),
                    botonIngresarLogin(context, controlerU, controlerP),
                  ],
                ),
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
    this.controlerU.dispose();
    this.controlerP.dispose();
  }
}


