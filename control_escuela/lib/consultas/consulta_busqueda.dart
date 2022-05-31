import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:control_escuela/consultas/consultasBDApp.dart';

class Busqueda{
  late BD bd=new BD();
  
  Future<QuerySnapshot> buscarDatos(String tabla) async
  {
    CollectionReference collectionReference=FirebaseFirestore.instance.collection(tabla);
    QuerySnapshot C= await collectionReference.get();
    /*
    if(C.docs.length != 0){
      return C;
      for(var doc in C.docs){
        Resultados.add(doc.data());
      }
    }*/
    return C;
  }


  Future<int> login(String user, String pass)async{
    int respuesta=0;
    CollectionReference collectionReference=FirebaseFirestore.instance.collection(bd.tabla_docente);
    QuerySnapshot C= await collectionReference.get();
    if(C.docs.length != 0){
      for(var doc in C.docs){
        if(doc.get(bd.campo_tabla_docente_usuario)==user&&doc.get(bd.campo_tabla_docente_clave)==pass)
        {
          respuesta=1;
          QuerySnapshot TipoU= await buscarDatos(bd.tabla_tipo_usuario);
          if(TipoU.docs.length != 0){
            for(var T in TipoU.docs)
            {
              if(T.id==doc.get(bd.campo_tabla_docente_id_tipo_usuario)&&T.get(bd.campo_tabla_tipo_usuario_tipo)==0)
              {
                respuesta=2;
              }
            }}
        }
      }
    }
    return respuesta;
  }
}