//import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:petinder/models/user.dart';
import 'package:petinder/services/database.dart';

class AuthService {
  //final Firestore _firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
 // final GoogleSignIn _googleSignIn = GoogleSignIn();
  //create user obj based on FirebaseUser
   User _userFromFirebaseUser(FirebaseUser user){
   return user != null ? User(uid: user.uid): null ;
   //return (await _auth.currentUser()).uid;
    
   }
  // auth change user stream
  Stream<User> get user {
   return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
   }

   //sign in anon
  Future signInAnon() async {
    try{
     AuthResult result = await _auth.signInAnonymously();
     FirebaseUser user = result.user;
      return _userFromFirebaseUser(user); 
  
    } catch(e){
        print(e.toString());
        return null;
      }
    }
    // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }
//GET UID
Future<String> getCurrentUID()  async {
  return (await _auth.currentUser()).uid;
}
//get current user
Future getCurrentUser()  async {
  return await _auth.currentUser();
}
//sign in with email & password
Future signInWithEmailAndPassword(String email, String password) async {
        try{
          AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
          FirebaseUser user = result.user;
          return _userFromFirebaseUser(user);
           } catch(e){
             print(e.toString());
             return null;
           }
 }


//register with email & password
     Future registerWithEmailAndPassword(String email, String password) async {
        try{
          AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          FirebaseUser user = result.user;

          // create a new document for the user with the uid
          await DatabaseService(uid: user.uid).updateUserData('0','new user', 100);
          return _userFromFirebaseUser(user);
     
           } catch(e){
             print(e.toString());
             return null;
           }
           
 }

  
 /*Future<bool> isFirstTime(String userId) async {
    bool exist;
    await Firestore.instance
        .collection('users')
        .document(userId)
        .get()
        .then((user) {
      exist = user.exists;
    });

    return exist;
  }
Future<bool> isSignedIn() async {
    final currentUser = _auth.currentUser();
    return currentUser != null;
  }
//sign out
*/
Future signOut() async {
  try {
    return await _auth.signOut();    
    } 
    catch(e){
      print(e.toString());
    return null;
  }
  }
 /*  //profile setup
  Future<void> profileSetup(
      File photo,
      String userId,
      String name,
      String gender,
      String interestedIn,
      DateTime age, 
      GeoPoint location,
      ) async {
    StorageUploadTask storageUploadTask;
    storageUploadTask = FirebaseStorage.instance
        .ref()
        .child('userPhotos')
        .child(userId)
        .child(userId)
        .putFile(photo);

    return await storageUploadTask.onComplete.then((ref) async {
      await ref.ref.getDownloadURL().then((url) async {
        await _firestore.collection('users').document(userId).setData({
          'uid': userId,
          'photoUrl': url,
          'name': name,
          'gender': gender,
          "location": location,
          'interestedIn': interestedIn,
          'age': age
        });
      });
    });*/

      }
  