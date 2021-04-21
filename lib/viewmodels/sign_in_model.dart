import 'package:petinder/viewmodels/base_model.dart';

class SignInModel extends BaseModel {
  //final AuthService _authService = getIt<AuthService>();
 //final Firestore _firestore = Firestore.instance;

  /*Future<void> signIn(String userName) async {
    if(userName.isEmpty) return;
    busy = true;
    try {
      var user = await _authService.signIn();
      await _firestore.collection('profile').document(user.uid).setData({'userName': userName, 'image': 'https://placekitten.com/200/200'});
    } catch (e) {
      busy = false;
    }

    busy = false;
  }*/
}
