import 'package:control_escuela/paginas/campos.dart';
import 'package:flutter/material.dart';

class RegistroCalificacion extends StatefulWidget {
  const RegistroCalificacion({ Key? key }) : super(key: key);

  @override
  State<RegistroCalificacion> createState() => _RegistroCalificacionState();
}

class _RegistroCalificacionState extends State<RegistroCalificacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: baseRCalificacion(context),
    );
  }
  String valorInicial = 'Item1';

  Widget baseRCalificacion(BuildContext context){
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
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("registro de nota", style: TextStyle(fontSize: 30),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
///////////////////////selecct////////////////////////////////
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                              child: DropdownButton<String>(
                                value: valorInicial,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? valor) => {
                                  setState((){
                                    valorInicial=valor!;
                                  })
                                },
                                items: <String>['Item1', 'Item2', 'Item3', 'Item4'].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
//////////////////////////////////////////////////////////////////

                          camposRelevo("asignatura"),
                          camposRelevo("período/numero de evaluacion"),
                          Mostrar_notas(),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFD6D6D6),
                      border: Border.all(width: 5.0, color: const Color(0xFF000000), style: BorderStyle.solid),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  botonGuardarOListo(context),
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
}