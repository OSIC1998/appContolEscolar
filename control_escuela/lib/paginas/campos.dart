import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:control_escuela/consultas/consulta_Modificar.dart';
import 'package:control_escuela/consultas/consulta_busqueda.dart';
import 'package:control_escuela/consultas/consultasBDApp.dart';
import 'package:control_escuela/consultas/consuta_insercion.dart';
import 'package:control_escuela/paginas/AdministrarDosentes.dart';
import 'package:control_escuela/paginas/LoginUser.dart';
import 'package:control_escuela/paginas/RegistrarCalificaciones.dart';
import 'package:control_escuela/paginas/menu.dart';
import 'package:control_escuela/paginas/nuevoDocente.dart';
import 'package:control_escuela/paginas/paginaregalumno.dart';
import 'package:control_escuela/paginas/paginasalones.dart';
import 'package:control_escuela/paginas/reportes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

late Busqueda B=new Busqueda();
late BD bd=new BD();
late modificar m=new modificar();
late insertar i=new insertar();


Widget camposGeneral(String Ncampo, TextEditingController textEditingController) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: Ncampo, fillColor: Colors.white, filled: true),
            
      ));
}
Widget fechaGeneral(String Ncampo, TextEditingController textEditingController) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        controller: textEditingController,
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

Widget camposPass(String Ncampo, TextEditingController textEditingController) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: textEditingController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: Ncampo, fillColor: Colors.white, filled: true),
    )
  );
}


Widget selecctGeneral(BuildContext context,String nombre,String tabla,String campo, String campo2, TextEditingController CS, TextEditingController CIDS) {
  return GestureDetector(
    onTap: () async {
      QuerySnapshot buscado= await B.buscarDatos(tabla);
      List<String> campoSelec=[];
      List<String> idcampo=[];
      List<String> campoSelec2=[];
      if(buscado.docs.length != 0){
        for(var bus in buscado.docs)
        {
          campoSelec.add(bus.get(campo).toString());
          idcampo.add(bus.id);
          campoSelec2.add(bus.get(campo2).toString());
        }
      }
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text("Seleccionar 1"),
        content: mostrarSelecct(context, campoSelec, campoSelec2, idcampo, CS, CIDS),
      ));
    },
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: TextFormField(
          enabled: false,
          controller: CS,
          decoration: InputDecoration(
              hintText: nombre, fillColor: Colors.white, filled: true),
              
        )),
  );
}


Widget mostrarSelecct(BuildContext context, List<String> campoSelec,List<String> campoSelec2, List<String> idcampo, TextEditingController CS, TextEditingController CIDS){
  return Container(
    width: double.infinity,
    child: Column(
      children: List.generate(campoSelec.length, (index){
        return Padding(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
              CS.text=campoSelec[index]+" "+campoSelec2[index];
              CIDS.text=idcampo[index];
              Navigator.of(context).pop();
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.lightGreenAccent, borderRadius: BorderRadius.circular(10),),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(campoSelec[index]+" "+campoSelec2[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                ),
              ),
            )
          )
        );
      }),
    ),
  );
}

Widget botonIngresarLogin(BuildContext context, TextEditingController CU, TextEditingController CP) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00ff0069fe),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 5.0),
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
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 5.0),
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
Widget botonEditarDosente(BuildContext context, TextEditingController idB,TextEditingController nombre,TextEditingController direccion,TextEditingController apellido,TextEditingController clave,TextEditingController correo,TextEditingController fecha,TextEditingController tipo,TextEditingController telefono,TextEditingController user) {
  return Container(
    child: MaterialButton(
      color: const Color(0x00ff0069fe),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:50, vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: () async {
          //print(idB.text);
          QuerySnapshot dosente= await B.buscarDatos(bd.tabla_docente);
          if(idB.text!="")
          {
            if(dosente.docs.length != 0){
              for(var doc in dosente.docs){
                if(doc.id==idB.text){
                  nombre.text=doc.get(bd.campo_tabla_docente_nombre).toString();
                  direccion.text=doc.get(bd.campo_tabla_docente_direccion).toString();
                  apellido.text=doc.get(bd.campo_tabla_docente_apellido).toString();
                  clave.text=doc.get(bd.campo_tabla_docente_clave).toString();
                  correo.text=doc.get(bd.campo_tabla_docente_correo).toString();
                  fecha.text=doc.get(bd.campo_tabla_docente_fecha_Nacimiento).toString();
                  tipo.text=doc.get(bd.campo_tabla_docente_id_tipo_usuario).toString();
                  telefono.text=doc.get(bd.campo_tabla_docente_telefon).toString();
                  user.text=doc.get(bd.campo_tabla_docente_usuario).toString();
                }
              }
              
            }
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text("editar Dosente"),
              content: camposDosentes(context, nombre, direccion, apellido, clave, correo, fecha, tipo, telefono, user),
              actions: <Widget>[
                FlatButton(onPressed: () async {
                  if(nombre.text==""||direccion.text==""||apellido.text==""||clave.text==""||correo.text==""||tipo.text==""||telefono.text==""||user.text=="")
                  {
                    showDialog(context: context, builder: (context)=>AlertDialog(
                      content: Text("No dejar campos vacíos"),
                      actions: <Widget>[
                        FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))
                      ],
                    ));
                  }
                  else{
                    int R= await m.ModificarDosente(idB, nombre, direccion, apellido, clave, correo, fecha, tipo, telefono, user);
                    if(R==1)
                    {
                      nombre.text="Docente modificado con éxito";
                      idB.text="";
                    }
                    else{
                      nombre.text="Error no se pudo modificar";
                      idB.text="";
                    }
                    Navigator.of(context).pop();
                  }
                }, child: Text("guardar")),
                FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("canselar"))
              ],
            ));
          }
          else{
            showDialog(context: context, builder: (context)=>AlertDialog(
              content: Text("deve seleccionar 1 opcion"),
              actions: <Widget>[
                FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))
              ],
            ));
          }
        },
        child: Text(
          "Editar",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}

Widget camposDosentes (BuildContext context,TextEditingController nombre,TextEditingController direccion,TextEditingController apellido,TextEditingController clave,TextEditingController correo,TextEditingController fecha,TextEditingController tipo,TextEditingController telefono,TextEditingController user) {
  final CS=TextEditingController();
  return Container(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          camposGeneral("nombre", nombre),
          camposGeneral("apellido", apellido),
          camposGeneral("correo", correo),
          camposGeneral("usuario", user),
          camposGeneral("contraseña", clave),
          camposGeneral("direccion", direccion),
          selecctGeneral(context, tipo.text, bd.tabla_tipo_usuario, bd.campo_tabla_tipo_usuario_tipo, bd.campo_tabla_tipo_usuario_nombre, CS, tipo),
          camposGeneral("telefono", telefono),
          
        ],
      ),
    ),
  );
}
Widget botonagregarGuardar(BuildContext context) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00ff0069fe),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: (){
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: agregarDosente()));
        },
        child: Text(
          "agregar dosente",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}
Widget botonGuardarNuevoDocente(BuildContext context,TextEditingController nombre,TextEditingController direccion,TextEditingController apellido,TextEditingController clave,TextEditingController correo,TextEditingController fecha,TextEditingController tipo,TextEditingController telefono,TextEditingController user) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: const Color(0x00ff0069fe),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
        ),
        onPressed: () async {
          if(nombre.text==""||direccion.text==""||apellido.text==""||clave.text==""||correo.text==""||tipo.text==""||telefono.text==""||user.text==""||tipo.text=="")
          {
            showDialog(context: context, builder: (context)=>AlertDialog(
              content: Text("No dejar campos vacíos"),
              actions: <Widget>[
                FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))
              ],
            ));
          }
          else
          {
            int R= await i.AgregarDosente(nombre, direccion, apellido, clave, correo, fecha, tipo, telefono, user);
            if(R==1)
            {
              nombre.text="Docente agregado con éxito";
            }
            else{
              nombre.text="Error no se pudo agregar";
            }
            Navigator.of(context).pop();
          }
        },
        child: Text(
          "agregar dosente",
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
      padding: EdgeInsets.symmetric(horizontal:10, vertical: 5.0),
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
        adminDosente(),
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
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 5.0),
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
      padding: EdgeInsets.symmetric(horizontal:100, vertical: 5.0),
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
Widget botonMostrarnotas(BuildContext context, TextEditingController idDosente,TextEditingController idMateria){
  return Container(
    width: double.infinity,
    child: MaterialButton(
      color: Color.fromARGB(255, 26, 223, 4),
      elevation: 0.0,
      padding: EdgeInsets.symmetric(horizontal:5, vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
        ),
        onPressed: () async {
          List<String> listaFiltradaNombre=[];
          String NombreA="";
          List<String> listaFiltradaNotas=[];
          String notas="";
          List<double> listaFiltradapromedios=[];
          double promedio=0.0;
          QuerySnapshot MateriasIncritas= await B.buscarDatos(bd.tabla_materia_inscripta);
          if(MateriasIncritas.docs.length != 0){
            if(idDosente.text!=""||idMateria.text!="")
            {

            }
            else
            {
              for(var MI in MateriasIncritas.docs)
              {
                QuerySnapshot alumno= await B.buscarDatos(bd.tabla_tablaalumno);
                if(alumno.docs.length!=0){
                  for(var A in alumno.docs){
                    if(A.id==MI.get(bd.campo_tabla_materia_inscripta_id_alumno)){
                      NombreA=A.get(bd.campo_tabla_tablaalumno_nombre)+" "+A.get(bd.campo_tabla_tablaalumno_apellido);
                    }
                  }
                }
                QuerySnapshot notaAlum= await B.buscarDatos(bd.tabla_notas);
                if(notaAlum.docs.length!=0){
                  for(var NA in notaAlum.docs){
                    if(NA.id==MI.get(bd.campo_tabla_materia_inscripta_id_nota)){
                      notas=NA.get(bd.campo_tabla_notas_nota1).toString()+", "+NA.get(bd.campo_tabla_notas_nota2).toString()+", "+NA.get(bd.campo_tabla_notas_nota3).toString()+", "+NA.get(bd.campo_tabla_notas_nota4).toString()+", "+NA.get(bd.campo_tabla_notas_nota5).toString();
                      promedio=(NA.get(bd.campo_tabla_notas_nota1)+NA.get(bd.campo_tabla_notas_nota2)+NA.get(bd.campo_tabla_notas_nota3)+NA.get(bd.campo_tabla_notas_nota4)+NA.get(bd.campo_tabla_notas_nota5))/5;
                    }
                  }
                }
                listaFiltradaNombre.add(NombreA);
                listaFiltradaNotas.add(notas);
                listaFiltradapromedios.add(promedio);

              }
            }
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text("alunnos"),
              content: filtroNotas(context, listaFiltradaNombre,listaFiltradaNotas,listaFiltradapromedios),
            ));
          }
        },
        child: Text(
          "ver listado",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
    )
  );
}
Widget filtroNotas(BuildContext context, List<String> listaFiltradaNombre, List<String> listaFiltradaNotas, List<double> listaFiltradaPromedios){
  return Container(
    width: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(210, 12, 97, 189),
            child: Column(
              children: List.generate(listaFiltradaNombre.length, (index){
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                                child: Text("NOMBRE", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(listaFiltradaNombre[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                                child: Text("NOTAS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(listaFiltradaNotas[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                                child: Text("PROMEDIO", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(listaFiltradaPromedios[index].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                );
              }),
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
    ),
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