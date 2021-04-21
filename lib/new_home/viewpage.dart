import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petinder/new_home/addpage.dart';
import 'package:petinder/new_home/informationPage.dart';
import 'package:petinder/new_home/listviewpage.dart';
import 'package:petinder/new_home/updatepage.dart';



class CommonThings {
  static Size size;
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController animalInputController;
  TextEditingController nameInputController;
  String id;
  final db = Firestore.instance;
  //final _formKey = GlobalKey<FormState>();
  String name;
  String animal;

  //create function for delete one register
   void deleteData(DocumentSnapshot doc) async {
    await db.collection('animals').document(doc.documentID).delete();
    setState(() => id = null);
  }

  //create tha funtion navigateToDetail
  navigateToDetail(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyUpdatePage(
                  ds: ds,
                )));
  }

   //create tha funtion navigateToDetail
  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyInfoPage(
                  ds: ds,
                )));
  }


  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('View Page1'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            tooltip: 'List',
            onPressed: () { 
              Route route = MaterialPageRoute(builder: (context) => MyListPage());
             Navigator.push(context, route);            
            },
          ),
  
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("animals").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('"Loading...');
          }
          int length = snapshot.data.documents.length;
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //two columns
              mainAxisSpacing: 0.1, //space the card
              childAspectRatio: 0.800, //space largo de cada card
          ),
           itemCount: length,
            padding: EdgeInsets.all(2.0),
            itemBuilder: (_, int index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];                         
              return new Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                             onTap: () => navigateToDetail(doc),
                            child: new Container(
                              child: Image.network(
                                '${doc.data["image"]}' + '?alt=media',
                              ),
                              width: 170,
                              height: 120,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            doc.data["name"],
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 19.0,
                            ),
                          ),
                          subtitle: Text(
                            doc.data["animal"],
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 12.0),
                          ),
                           onTap: () => navigateToDetail(doc),
                        ),
                      ),
                      Divider(),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: new Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () => deleteData(doc), //funciona
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blueAccent,
                                  ),
                                   onPressed: () => navigateToInfo(doc),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xffffe413),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => MyAddPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}