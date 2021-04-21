import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyInfoPage extends StatefulWidget {
  final DocumentSnapshot ds;
  MyInfoPage({this.ds});
  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  String productImage;
  String id;
  String name;
  String animal;
  String gender;
  String bio;

  TextEditingController nameInputController;
  TextEditingController animalInputController;
  TextEditingController genderInputController;
  TextEditingController bioInputController;

  Future getPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("animals").getDocuments();
    return qn.documents;
  }

   @override
  void initState() {
    super.initState();
    animalInputController =
        new TextEditingController(text: widget.ds.data["animal"]);
    nameInputController =
        new TextEditingController(text: widget.ds.data["name"]);
    genderInputController =
        new TextEditingController(text: widget.ds.data["gender"]);
    bioInputController =
        new TextEditingController(text: widget.ds.data["bio"]);
  /*  productImage = widget.ds.data["image"];
    print(productImage);*/
  }



  @override
  Widget build(BuildContext context) {
    getPost();
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
              /*  Row(
                  children: <Widget>[
                    new Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)),
                      padding: new EdgeInsets.all(5.0),
                      child: productImage == ''
                          ? Text('Edit')
                          : Image.network(productImage + '?alt=media'),
                    ),                    
                  ],
                ),*/
                new IniciarIcon(),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: nameInputController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Name", labelText: "Name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                new ListTile(
                  leading: const Icon(Icons.list, color: Colors.black),
                  title: new TextFormField(
                    
                    controller: animalInputController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Kind", labelText: "Kind"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                 new ListTile(
                  leading: const Icon(Icons.list, color: Colors.black),
                  title: new TextFormField(
                    
                    controller: genderInputController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Gender", labelText: "Gender"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                 new ListTile(
                  leading: const Icon(Icons.list, color: Colors.black),
                  title: new TextFormField(
                    maxLines: 10,
                    controller: bioInputController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Bio", labelText: "Bio"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconoMenu(
            icon: Icons.call,
            label: "Call",
          ),
          new IconoMenu(
            icon: Icons.message,
            label: "Message",
            
          ),
          new IconoMenu(
            icon: Icons.place,
            label: "Place",
          ),
        ],
      ),
      
    );
  }
}

class IconoMenu extends StatelessWidget {
  IconoMenu({this.icon, this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            label,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}
