import 'package:control_escuela/paginas/campos.dart';
import 'package:flutter/material.dart';

class reporte extends StatefulWidget {
  const reporte({ Key? key }) : super(key: key);

  @override
  State<reporte> createState() => _reporteState();
}

class _reporteState extends State<reporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: baseRCalificacion(context),
    );
  }
  String valorInicial1 = 'Item1';
  String valorInicial2 = 'Item1';
  String valorInicial3 = 'Item1';

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
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("reportes", style: TextStyle(fontSize: 30),),
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
                                value: valorInicial1,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? valor) => {
                                  setState((){
                                    valorInicial1=valor!;
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
///
///
///
//////////////////////////selecct////////////////////////////////
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                              child: DropdownButton<String>(
                                value: valorInicial2,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? valor) => {
                                  setState((){
                                    valorInicial2=valor!;
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
///
///
///
//////////////////////////selecct////////////////////////////////
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                              child: DropdownButton<String>(
                                value: valorInicial3,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black,
                                ),
                                onChanged: (String? valor) => {
                                  setState((){
                                    valorInicial3=valor!;
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
                  botonCancelar(context, "cancelar"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}