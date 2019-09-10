import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class Municipio {
  String igecem;
  String nombre;
  String significado;
  String cabecera;
  String superficie;
  String altitud;
  String clima;
  String latitud;
  String longitud;

  Municipio(this.igecem,this.nombre,this.significado,this.cabecera,this.altitud,this.superficie,this.clima,this.latitud,this.longitud);


  //se crea un mapa de archivos llevandolos a un objeto
  Municipio.map(dynamic obj)
  {
    this.nombre = obj ['nombre'];
    this.significado = obj ['significado'];
    this.cabecera = obj ['cabecera'];
    this.superficie = obj ['superficie'];
    this.altitud = obj ['altitud'];
    this.clima=obj ['clima'];
    this.latitud=obj ['latitud'];
    this.longitud=obj['longitud'];
  }


  String get id1 => igecem;
  String get nombre1 => nombre;
  String get Sig => significado;
  String get Cab => cabecera;
  String get Sup => superficie;
  String get Alt_ => altitud;
  String get Clima=>clima;
  String get Lat=>latitud;
  String get Lon=>longitud;


  //Crear la tabla para firebase atraves del mapeo
  //utilizando el fromSnapShop
  Municipio.fromSnapShop(DataSnapshot snapshot)
  {
    igecem = snapshot.key;
    nombre = snapshot.value['nombre'];
    significado = snapshot.value['significado'];
    cabecera = snapshot.value['cabecera'];
    superficie = snapshot.value['superficie'];
    altitud = snapshot.value['altitud'];
    clima=snapshot.value['clima'];
    latitud=snapshot.value['latitud'];
    longitud=snapshot.value['longitug'];


  }

}
