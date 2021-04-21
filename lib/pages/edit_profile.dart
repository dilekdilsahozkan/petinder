/*import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  File _image;
  
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

    Future uploadPic(BuildContext context) async{
      String filName = basename(_image.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(filName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture Uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Profile Picture Uploaded"),));
      });
    }

    return Positioned(
      child: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}*/