import 'package:examen_practico/modelo/municipio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



class PersonaInformacion extends StatefulWidget{
 final Municipio persona;
 PersonaInformacion(this.persona);
  @override
  _PersonaInformationState createState() => _PersonaInformationState();
}

final productReference = FirebaseDatabase.instance.reference().child('municipio');



class _PersonaInformationState extends State<PersonaInformacion>
{
  List<Municipio> items;
  @override

  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Municipios'),
        backgroundColor: Colors.green,

      ),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text("Nombre : ${widget.persona.nombre}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Apellido Paterno : ${widget.persona.significado}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Apellido Materno: ${widget.persona.cabecera}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Telefono : ${widget.persona.superficie}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Correo : ${widget.persona.altitud}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}