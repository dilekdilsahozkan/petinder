import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _email;
  String _name;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _currentUser();
  }

  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Container(
        child: Center(
              child: Text(
            "Hoşgeldiniz! \n $_email  $_name",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          )),
      ),
    );
  }
  
  void _currentUser() async {
    await _auth.currentUser().then((user) {
      setState(() {
        _email = user.email;
      });
    });
    setState(() {
      _isLoading = false;
    });
  }
}