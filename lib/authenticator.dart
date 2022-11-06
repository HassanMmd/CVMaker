import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  final _auth = FirebaseAuth.instance;

  Future<String> getIDToken() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
    return await _auth.currentUser!.getIdToken();
  }
}
