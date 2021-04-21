import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:petinder/menu_dashboard_layout/menu_dashboard_layout.dart';

class CommonThings {
  static Size size;
}

class MyAddPage extends StatefulWidget {
  @override
  _MyAddPageState createState() => _MyAddPageState();
}

class _MyAddPageState extends State<MyAddPage> {
  TextEditingController animalInputController;
  TextEditingController nameInputController;
  TextEditingController imageInputController;
  File _image;
  String filename;
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String gender;
  String animal;
  String bio;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    // ignore: unused_element
    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      var downloadUrl =
          await (await uploadTask.onComplete).ref.getDownloadURL();
      print("this is url $downloadUrl");
      // ignore: unused_local_variable
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      // ignore: unused_local_variable
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Animal'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: new SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child: (_image != null)
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    "https://www.netclipart.com/pp/m/147-1479847_icone-contact-png-user-silhouette-icon.png",
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple)),
                      labelText: "NAME",
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name';
                      }
                    },
                    onSaved: (value) => name = value,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.purple)),
                          labelText: "CATEGORY",
                          labelStyle: TextStyle(fontSize: 15),
                        ),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter kind';
                          }
                        },
                        onSaved: (value) => animal = value,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.purple)),
                          labelText: "GENDER",
                          labelStyle: TextStyle(fontSize: 15),
                        ),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter gender';
                          }
                        },
                        onSaved: (value) => gender = value,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              maxLines: 5,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: Colors.purple)),
                labelText: "BIO",
                labelStyle: TextStyle(fontSize: 20),
              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some bio';
                }
              },
              onSaved: (value) => bio = value,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  child:
                      Text('Add Animal', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.purpleAccent,
                  onPressed: () async {
                    uploadPic(context);
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      DocumentReference ref =
                          await db.collection('animals').add({
                        'name': '$name',
                        'animal': '$animal',
                        'gender': '$gender',
                        'bio': '$bio',
                        'image': '$_image'
                      });
                      setState(() => id = ref.documentID);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MenuDashboardLayout();
                        }),
                      ); //regrese a la pantalla anterior
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }
}
