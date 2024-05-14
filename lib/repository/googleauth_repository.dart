import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> signUpWithGoogle() async {
    await _googleSignIn.signIn();
    //if google ...
  }

  Future<void> signUpWithEmailandPassword(String email, String password) async {
    try {
      print("SIgnin happening");
      UserCredential response = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (response.credential != null) {
        print(response);
      }
    } on FirebaseAuthException catch (e) {
      print("Exception has occured $e");
    }
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("success $response");

      var token = await firebaseAuth.currentUser?.getIdToken(true);

      print(token);
    } catch (e) {
      print("Excured $e");
    }
  }
}
