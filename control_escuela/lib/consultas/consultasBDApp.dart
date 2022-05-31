import 'package:cloud_firestore/cloud_firestore.dart';

class BD{
  ///////////////////             tablas
  get tabla_tipo_usuario => "tipo_usuario";
  get tabla_docente => "docente";
  get tabla_materia => "materia";
  get tabla_materia_inscripta => "materia_inscripta";
  get tabla_notas => "notas";
  get tabla_salones => "salones";
  get tabla_seccion => "seccion";
  get tabla_tablaalumno => "tablaalumno";
  /////////////////////////////////////////////////////////
  ///
  ///
//////////////////////             tabla_docente
  get campo_tabla_docente_direccion => "direccion";
  get campo_tabla_docente_apellido => "apellido";
  get campo_tabla_docente_clave => "clave";
  get campo_tabla_docente_correo => "correo";
  get campo_tabla_docente_fecha_Nacimiento => "fecha_Nacimiento";
  get campo_tabla_docente_id_tipo_usuario => "id_tipo_usuario";
  get campo_tabla_docente_nombre => "nombre";
  get campo_tabla_docente_telefon => "telefon";
  get campo_tabla_docente_usuario => "usuario";
////////////////////////////////////////////////////////////////////////
///
///
//////////////////////////////////                  tipo_usuario
  get campo_tabla_tipo_usuario_nombre=>"nombre";
  get campo_tabla_tipo_usuario_tipo=>"tipo";
////////////////////////////////////////////////////////////////////////
///
///
////////////////////////////////////                        codigo_materia
  get campo_tabla_materia_codigo_materia=>"codigo_materia";
  get campo_tabla_materia=>"nombre";
  ////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///////////////////////////////////                       notas
  get campo_tabla_notas_nota1=>"nota1";
  get campo_tabla_notas_nota2=>"nota2";
  get campo_tabla_notas_nota3=>"nota3";
  get campo_tabla_notas_nota4=>"nota4";
  get campo_tabla_notas_nota5=>"nota5";
  /////////////////////////////////////////////////////////////////////////
  ///
  ///
  ////////////////////////////////////                           salones
  get campo_tabla_salones_direccion=>"direccion";
  get campo_tabla_salones_nombre=>"nombre";
  ////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  /////////////////////////////////////                            seccion
  get campo_tabla_seccion_nombre=>"nombre";
  /////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///////////////////////////////////////                           tablaalumno
  get campo_tabla_tablaalumno_apellido=>"apellido";
  get campo_tabla_tablaalumno_direccion=>"direccion";
  get campo_tabla_tablaalumno_fecha_Nacimiento=>"fecha_Nacimiento";
  get campo_tabla_tablaalumno_nombre=>"nombre";
  get campo_tabla_tablaalumno_=>"telefon";
  ///////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ////////////////////////////////////////                        materia_inscripta
  get campo_tabla_materia_inscripta_id_alumno=>"id_alumno";
  get campo_tabla_materia_inscripta_fecha_inscripcion=>"fecha_inscripcion";
  get campo_tabla_materia_inscripta_id_docente=>"id_docente";
  get campo_tabla_materia_inscripta_id_materia=>"id_materia";
  get campo_tabla_materia_inscripta_id_nota=>"id_nota";
  get campo_tabla_materia_inscripta_id_salon=>"id_salon";
  get campo_tabla_materia_inscripta_id_seccion=>"id_seccion";
  ////////////////////////////////////////////////////////////////////////////////////////


}

