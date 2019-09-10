import 'package:examen_practico/modelo/municipio.dart';
import 'package:examen_practico/vistas/municipio_screen.dart';
import 'package:examen_practico/vistas/personas_information.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart' as prefix0;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';



//stful para auto acompletar

class ListViewPersona extends StatefulWidget {
  @override
  _ListViewPersonaState createState() => _ListViewPersonaState();
}

//Instanciar la base de datos de firebase y crear la tabla

final personasReference = FirebaseDatabase.instance.reference().child('municipio');

class _ListViewPersonaState extends State<ListViewPersona> {

  //agregar los registros de las personas aun list

  List<Municipio> items;
  StreamSubscription<Event> _registrodepersonas;
  StreamSubscription<Event> _editardepersonas;


  //---

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List();
    _registrodepersonas =
        personasReference.onChildAdded.listen(_registrodepersonas1);
    _editardepersonas =
        personasReference.onChildChanged.listen(_editardepersonas1);
  }

  //tecla cancelar

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _registrodepersonas.cancel();
    _editardepersonas.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de personas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Municpios'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,

        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length, padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 7.0,),
                    Row(
                      children: <Widget>[
                        Expanded(child: ListTile(title: Text(
                          '${items[position].nombre}',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 21.0,
                          ),
                        ),
                            subtitle: Text('${items[position].nombre}',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 21.0,
                              ),
                            ),

                            leading: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 17.0,
                                  child: Text('${items[position].nombre}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            onTap: () => _navigatePersonaInformacion(context, items[position],null)),),
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.red,),
                            onPressed: () =>
                                _deletePersona(
                                    context, items[position], position)),
                        IconButton(
                            icon: Icon(Icons.edit, color: Colors.yellow,),
                            onPressed: () =>
                                _editarPersona(context, items[position],null)),
                      ],
                    ),
                  ],
                );
              }

          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.green,),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => _nuevapersona(context, null,null),
        ),
      ),
    );
  }


  void _registrodepersonas1(Event event) {
    setState(() {
      items.add(new Municipio.fromSnapShop(event.snapshot));
    });
  }

  void _editardepersonas1(Event event) {
    //con esto se puede hacer una consulta con el igecem
    var personaanterior = items.singleWhere((personas) =>
    personas.igecem == event.snapshot.key);
    setState(() {
      items[items.indexOf(personaanterior)] =
      new Municipio.fromSnapShop(event.snapshot);
    });
  }

  void _deletePersona(BuildContext context, Municipio persona,
      int position) async {
    //se utiliza para ir a alguna pantalla que se desee o ejecutar un metodo que se requiera
    await personasReference.child(persona.igecem).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigatePersonaInformacion(BuildContext context, Municipio persona,
      int position) async {
    //se utiliza para ir a alguna pantalla que se desee o ejecutar un metodo que se requiera
    await Navigator.push(
      context, MaterialPageRoute(builder: (context) => PersonaScreen(persona)),
    );
  }

  void _editarPersona(BuildContext context, Municipio persona,
      int position) async {
    //se utiliza para ir a alguna pantalla que se desee o ejecutar un metodo que se requiera
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => PersonaInformacion(persona)),
    );
  }

  void _nuevapersona(BuildContext context, Municipio persona,
      int position) async {
    //se utiliza para ir a alguna pantalla que se desee o ejecutar un metodo que se requiera
    await Navigator.push(
      context, MaterialPageRoute(builder: (context) => PersonaScreen(Municipio(null,'','','','','','','',''))),
    );
  }
}