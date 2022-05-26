import 'package:control_escuela/consultas/consulta_busqueda.dart';
import 'package:control_escuela/consultas/consultasBDApp.dart';
import 'package:control_escuela/paginas/LoginUser.dart';
import 'package:control_escuela/paginas/RegistrarCalificaciones.dart';
import 'package:control_escuela/paginas/menu.dart';
import 'package:control_escuela/paginas/paginaregalumno.dart';
import 'package:control_escuela/paginas/paginasalones.dart';
import 'package:control_escuela/paginas/reportes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

late Busqueda B=new Busqueda();
late BD bd=new BD();


Widget camposGeneral(String Ncampo, TextEditingController) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        controller: TextEditingController,
        decoration: InputDecoration(
            hintText: Ncampo, fillColor: Colors.white, filled: true),
            
      ));
}

Widget camposRelevo(String campo) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: campo, fillColor: Colors.white, filled: true),
      ));
}


Widget camposPass(String Ncampo, TextEditingController) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: TextEditingController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: Ncampo, fillColor: Colors.white, filled: true),
    )
  );
}

Widget botonIngresarLogin(BuildContext context, TextEditingController CU, TextEditingController CP) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00ff0069fe),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: () async {
          if(CU.text=="" || CP.text==""){
            showDialog(context: context, builder: (context)=>AlertDialog(
              content: Text("llenar los campos vasios"),
              actions: <Widget>[
                FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))
              ],
            ));
          }
          else{
            String titulA="";
            String contenidoA="";
            int R= await B.login(CU.text, CP.text);
            switch(R)
            {
              case 2:{
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: menuapp()));
              }
              break;
              case 1:{
                titulA="usuario no tiene permiso";
                contenidoA="usuario no cuenta con el nivel nesesarrio para ingresar a la app";
              }
              break;
              default:{
                titulA="usuario no encontrado";
                contenidoA="usuario o contraseña incorrectos";
              }
              break;
              
            }
            if(R==0){
              showDialog(context: context, builder: (context)=>AlertDialog(
                title: Text("usuario no encontrado"),
                content: Text("usuario o contraseña incorrectos"),
                actions: <Widget>[
                  FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))
                ],
              ));
            }
          }
        },
        child: Text(
          "iniciar sesion",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}

Widget botonGuardarOListo(BuildContext context) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00ff0069fe),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: (){
          Navigator.pop(context, PageTransition(type: PageTransitionType.fade, child: menuapp()));
        },
        child: Text(
          "guardar",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}

Widget botonesMenuNavigator(BuildContext context, String varTexto, int rutaBoton){
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00ff0069fe),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:10, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: (){
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: getPaginas(rutaBoton)));
        },
        child: Text(
          varTexto,
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}
Widget getPaginas(int rutaBoton) {
    return IndexedStack(
      index: rutaBoton,
      children: [
        pagina(),
        AdminSalones(),
        login(),
        login(),
        RegistroCalificacion(),
        reporte(),
      ],
    );
  }

Widget botonCancelar(BuildContext context, String texto) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00fff44336),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text(
          texto,
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}
Widget botonCerrarSecion(BuildContext context) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00fff44336),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => login(),
            ),
            (route) => false,
          );
        },
        child: Text(
          "Cerrar Secion",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}

Widget Mostrar_notas(){
  return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("alumn@"),
                    Text("notas"),
                    Text("promedio"),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD6D6D6),
                border: Border.all(width: 1.0, color: const Color(0xFF000000), style: BorderStyle.solid),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
}