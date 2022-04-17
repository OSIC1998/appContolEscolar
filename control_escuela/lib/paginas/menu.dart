import 'package:control_escuela/paginas/campos.dart';
import 'package:flutter/material.dart';

class menuapp extends StatefulWidget {


  @override
  State<menuapp> createState() => _menuappState();
}

class _menuappState extends State<menuapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: botonesMenu(context),
    );
  }

  Widget botonesMenu(BuildContext context)
  {
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      'menu app',
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  SizedBox(
                    height: 50,
                  ),
                  
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: botonesMenuNavigator(context, "registrar alumno", 0),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Center(
                          child: botonesMenuNavigator(context, "salones", 1),
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),


                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: botonesMenuNavigator(context, "administrar docentes", 2),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Center(
                          child: botonesMenuNavigator(context, "materias de docentes", 3),
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),


                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: botonesMenuNavigator(context, "registrar calificaciones", 4),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Center(
                          child: botonesMenuNavigator(context, "reportes", 5),
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  botonCerrarSecion(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}