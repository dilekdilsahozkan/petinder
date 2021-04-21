import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
File image;
String filename;

class MyUpdatePage extends StatefulWidget {
  final DocumentSnapshot ds;
  MyUpdatePage({this.ds});
  @override
  _MyUpdatePageState createState() => _MyUpdatePageState();
}

class _MyUpdatePageState extends State<MyUpdatePage> {
  String productImage;
  TextEditingController animalInputController;
  TextEditingController nameInputController;
  TextEditingController imageInputController;

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String animal;

  pickerCam() async {
    // ignore: deprecated_member_use
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    // ignore: deprecated_member_use
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animalInputController =
        new TextEditingController(text: widget.ds.data["animal"]);
    nameInputController =
        new TextEditingController(text: widget.ds.data["name"]);
    productImage = widget.ds.data["image"]; //nuevo
    print(productImage); //nuevo
  }

  /*
  updateData(selectedDoc, newValues) {
    Firestore.instance
        .collection('animals')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      // print(e);
    });
  }
  */

  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("animals").getDocuments();
    // print();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    getPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.blueAccent),
                      ),
                      padding: new EdgeInsets.all(5.0),
                      child: image == null ? Text('Add') : Image.file(image),
                    ),
                    
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.camera_alt), onPressed: pickerCam),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.image), onPressed: pickerGallery),
                  ],
                ),
                SizedBox(
                        height: 10,
                      ),
                Container(
                  child: TextFormField(
                    controller: nameInputController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.purple)
                      ),
                      labelText: "NAME",
                      labelStyle: TextStyle(fontSize: 20),
                      
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    onSaved: (value) => name = value,
                  ),
                ),
                SizedBox(
                        height: 10,
                      ),
                Container(
                  child: TextFormField(
                    controller: animalInputController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.purple)
                      ),
                      labelText: "KIND",
                      labelStyle: TextStyle(fontSize: 20),
                      
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some animal';
                      }
                    },
                    onSaved: (value) => animal = value,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
                        height: 10,
                      ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Update'),
                onPressed: () {
                  DateTime now = DateTime.now();
                  String nuevoformato =
                      DateFormat('kk:mm:ss:MMMMd').format(now);
                  var fullImageName = 'nomfoto-$nuevoformato' + '.jpg';
                  var fullImageName2 = 'nomfoto-$nuevoformato' + '.jpg';

                  final StorageReference ref =
                      FirebaseStorage.instance.ref().child(fullImageName);
                  // ignore: unused_local_variable
                  final StorageUploadTask task = ref.putFile(image);

                  var part1 =
                      'https://firebasestorage.googleapis.com/v0/b/petinder-278312.appspot.com/o/'; 

                  var fullPathImage = part1 + fullImageName2;
                  print(fullPathImage);
                  Firestore.instance
                      .collection('animals')
                      .document(widget.ds.documentID)
                      .updateData({
                    'name': nameInputController.text,
                    'animal': animalInputController.text,
                    'image': '$fullPathImage'
                  });
                  Navigator.of(context).pop(); 
                },
              ),
            ],
          )
        ],
      ),
    );
  }}