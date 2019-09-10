
import 'package:examen_practico/modelo/municipio.dart';
import 'package:examen_practico/vistas/listview_municipios.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class PersonaScreen extends StatefulWidget{
  final Municipio persona;
  PersonaScreen (this.persona);
  @override
  _PersonaScreenState createState() => _PersonaScreenState();
}

final productReference = FirebaseDatabase.instance.reference().child('municipio');


class _PersonaScreenState extends State<PersonaScreen>
{

  List<Municipio> items;

  TextEditingController _nombreController;
  TextEditingController _signidifacoController;
  TextEditingController _cabeceraController;
  TextEditingController _superficieControler;
  TextEditingController _altitudController;
  TextEditingController _climaController;
  TextEditingController _latitudController;
  TextEditingController _longitudController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _nombreController= new TextEditingController(text: widget.persona.nombre);
    _signidifacoController= new TextEditingController(text: widget.persona.significado);
    _cabeceraController= new TextEditingController(text: widget.persona.cabecera);
    _superficieControler= new TextEditingController(text: widget.persona.superficie);
    _altitudController= new TextEditingController(text: widget.persona.altitud);
    _climaController= new TextEditingController(text: widget.persona.clima);
    _latitudController= new TextEditingController(text: widget.persona.latitud);
    _longitudController= new TextEditingController(text: widget.persona.longitud);




  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text ("Crud Municpios"),
    backgroundColor: Colors.amberAccent,
    ),
      body: SingleChildScrollView(
        
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nombreController,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Nombre'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(),

                TextField(
                  controller: _cabeceraController,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Significado'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(),


                TextField(
                  controller: _signidifacoController,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Cabecera'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(),

                TextField(
                  controller: _superficieControler,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Superficie'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(),

                TextField(
                  controller: _altitudController,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Altitud'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(), 
                TextField(
                  controller: _climaController,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Clima'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(),
                 TextField(
                  controller: _latitudController,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Latitid'),
                  
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(), 
               TextField(
                  controller: _longitudController,
                  style: TextStyle(fontSize: 17.0,color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Longitud'),
                  
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),
                Divider(),
                FlatButton(onPressed: () {
                  if (widget.persona.igecem != null) {
                    personasReference.child(widget.persona.igecem).set({
                      'nombre': _nombreController.text,
                      'significado': _signidifacoController.text,
                      'cabecera': _cabeceraController.text,
                      'superficie': _superficieControler.text,
                      'altitud': _altitudController.text,
                      'clima':_climaController.text,
                      'latitud':_latitudController.text,
                      'longitud':_longitudController.text

                    }) .then((_){
                      Navigator.pop(context);
                    });
                  }else{
                    productReference.push().set({
                      'nombre': _nombreController.text,
                      'significado': _signidifacoController.text,
                      'cabecera': _cabeceraController.text,
                      'superficie': _superficieControler.text,
                      'altitud': _altitudController.text,
                      'clima':_climaController.text,
                      'latitud':_latitudController.text,
                      'longitud':_longitudController.text
                    }).then((_){
                      Navigator.pop(context);
                    });
                  }
                },
              child: (widget.persona.igecem != null )? Text('Update'): Text('Agregar')),
              ],
            ),
          ),
        ),
      ),
    );
  }

}