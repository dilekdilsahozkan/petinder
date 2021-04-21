import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:petinder/style/bottom_sheet_shape.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  File _image;
  @override
  Widget build(
    BuildContext context,
  ) {
    Future getImage() async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String filName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(filName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      // ignore: unused_local_variable
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    }

    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.purple),
          clipper: getClipper(),
        ),
        Positioned(
            width: 400.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: (_image != null)
                                ? Image.file(_image, fit: BoxFit.fill)
                                : NetworkImage(
                                    'https://banner2.cleanpng.com/20190306/hvj/kisspng-computer-icons-scalable-vector-graphics-user-profi-5c7fce1bebf476.2595769415518797079665.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 10.0, color: Colors.purple[200])
                        ])),
                SizedBox(height: 90.0),
                Text(
                  'Name Surname',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 25.0),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              height: 30.0,
                              width: 95.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Edit Name',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(width: 25.0),
                      Column(
                        children: <Widget>[
                          Container(
                              height: 30.0,
                              width: 95.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.blue[900],
                                color: Colors.blue,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                    getImage();
                                  },
                                  child: Center(
                                    child: Text(
                                      'Edit Photo',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(width: 25.0),
                      Column(
                        children: <Widget>[
                          Container(
                              height: 30.0,
                              width: 95.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.redAccent,
                                color: Colors.red,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                    _logOutOptions(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Log out',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 115, right: 115),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            child: Material(
                              borderRadius: BorderRadius.circular(40.0),
                                  shadowColor: Colors.purple,
                                  color: Colors.white,
                                  elevation: 15.0,
                                                        child: IconButton(
                                icon: Icon(Icons.close),
                                iconSize: 30,
                                onPressed: () {},
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            child: Material(
                              borderRadius: BorderRadius.circular(40.0),
                                  shadowColor: Colors.grey[800],
                                  color: Colors.purple,
                                  elevation: 15.0,
                                                        child: IconButton(
                                icon: Icon(FontAwesomeIcons.check),
                                iconSize: 30,
                                onPressed: () {
                                  uploadPic(context);
                                },
                                color: Colors.white,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
void _logOutOptions(BuildContext context) {
  showModalBottomSheet(
    shape: BottomSheetShape(),
    backgroundColor: Colors.black87,
    context: context, 
    builder: (context){
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 150,
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: (){
            },
            child: Text('LOG OUT!', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),),
          ),
          SizedBox(height: 10,),
          SizedBox(height: 10,),
          MaterialButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('Close', style: TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),),
          ),
        ],
      ),
    );
  });
}
// ignore: camel_case_types
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
