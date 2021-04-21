import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation{
  String id;
  String name;
  String profileImage;
  String displayMessage;

  Conversation({this.id, this.name,this.displayMessage,this.profileImage});

  factory Conversation.fromSnapshot(DocumentSnapshot snapshot){
    return Conversation(id: snapshot.documentID, name: 'dilek', profileImage: "https://placekitten.com/200/200", displayMessage: snapshot.data['displayMessage']);

  }
}