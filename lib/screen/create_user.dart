import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_validator/the_validator.dart';
import 'package:flutter/services.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _editingController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  String _name;
  String _lastname;
  String _username;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("SIGN UP")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            controller: _editingController,
                            onSaved: (x) {
                              setState(() {
                                _name = x;
                              });
                            },
                            validator: FieldValidator.required(
                                message: "Please Fill In!"),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 20),
                                labelText: "NAME",
                                labelStyle: TextStyle(fontSize: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.purple))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _editingController,
                            onSaved: (x) {
                              setState(() {
                                _lastname = x;
                              });
                            },
                            validator: FieldValidator.required(
                                message: "Please Fill In!"),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 20),
                                labelText: "SURNAME",
                                labelStyle: TextStyle(fontSize: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.purple))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _editingController,
                      onSaved: (x) {
                        setState(() {
                          _username = x;
                        });
                      },
                      validator: FieldValidator.required(
                          message: "Please Fill In!"),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          errorStyle: TextStyle(fontSize: 20),
                          labelText: "USERNAME",
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.purple))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _editingController,
                      onSaved: (x) {
                        setState(() {
                          _email = x;
                        });
                      },
                      autofocus: true,
                      validator: (x) {
                        if (x.isEmpty) {
                          return "Please Fill In!";
                        } else {
                          if (EmailValidator.validate(x) != true) {
                            return "Please input valid email address!";
                          } else {
                            return null;
                          }
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          errorStyle: TextStyle(fontSize: 18),
                          labelText: "EMAIL",
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.purple))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _editingController,
                      onSaved: (x) {
                        setState(() {
                          _password = x;
                        });
                      },
                      obscureText: true,
                      validator: FieldValidator.password(
                          minLength: 8,
                          shouldContainNumber: true,
                          shouldContainCapitalLetter: true,
                          shouldContainSpecialChars: true,
                          errorMessage:
                              "Minimum 8 Character!",
                          isNumberNotPresent: () {
                            return "It must include number!";
                          },
                          isSpecialCharsNotPresent: () {
                            return "It must include special Character!";
                          },
                          isCapitalLetterNotPresent: () {
                            return "It must include Capital Letter!";
                          }),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          errorStyle: TextStyle(fontSize: 18),
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.purple))),
                    ),
                    SizedBox(height: 10),
                    RaisedButton.icon(
                      icon: Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                      onPressed: _kayitEkle,
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      hoverColor: Colors.black,
                      label: Text(
                        " SIGN UP",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.purple)),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, "/");
                        },
                        leading: Icon(
                          Icons.email,
                          color: Colors.red,
                        ),
                        title: Text(
                          "SIGN IN WITH EMAIL",
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        trailing: Icon(Icons.arrow_right,
                            size: 32, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _kayitEkle() async {
     if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      String _id = _firestore.collection("users").document().documentID;

      Map<String, dynamic> _user = Map();
      _user["id"] = _id;
      _user["name"] = _name;
      _user["lastname"] = _lastname;
      _user["username"] = _username;
      _user["email"] = _email;
      _user["password"] = _password;

      var _firebaseUser = await auth
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .catchError((onError) => null);
          _firestore.document("users/$_id").setData(_user).then((value) {
            if (_firebaseUser != null) {
        Alert(
            type: AlertType.success,
            context: context,
            title: "REGISTERED!",
            desc: "Please confirm your mail address!",
            buttons: [
              DialogButton(
                child: Text(
                  "CLOSE",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ]).show();
        _formKey.currentState.reset();

        _firebaseUser.user
            .sendEmailVerification()
            .then((value) => null)
            .catchError((onError) => null);
            }
      }).catchError((hata) {
        Alert(
            type: AlertType.warning,
            context: context,
            title: "DID NOT REGISTER!",
            desc:
                "You Entered an Email Address Registered to the System. \n Please enter a different email address!",
            buttons: [
              DialogButton(
                child: Text(
                  "CLOSE",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ]).show();
      });
    }
  }
}
