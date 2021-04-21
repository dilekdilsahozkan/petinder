import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  getUserByUserName(String username){
    
  }

  Future<void> updateUserData(String surname, String name, int strength) async {
    return await userCollection.document(uid).setData({
      'Name': name,
      'Surname': surname,
    });
  }
    

}