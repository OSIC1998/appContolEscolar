import 'package:control_escuela/paginas/campos.dart';
import 'package:control_escuela/paginas/menu.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                  camposUsuario(),
                  SizedBox(
                    height: 10,
                  ),
                  camposPass(),
                  SizedBox(
                    height: 30,
                  ),
                  botonIngresarLogin(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


