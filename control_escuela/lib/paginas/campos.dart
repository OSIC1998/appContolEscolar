import 'package:control_escuela/paginas/LoginUser.dart';
import 'package:control_escuela/paginas/RegistrarCalificaciones.dart';
import 'package:control_escuela/paginas/menu.dart';
import 'package:control_escuela/paginas/paginaregalumno.dart';
import 'package:control_escuela/paginas/paginasalones.dart';
import 'package:control_escuela/paginas/reportes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';



Widget camposUsuario() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Usuario", fillColor: Colors.white, filled: true),
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


Widget camposPass() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password", fillColor: Colors.white, filled: true),
    )
  );
}

Widget botonIngresarLogin(BuildContext context) {
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
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: menuapp()));
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