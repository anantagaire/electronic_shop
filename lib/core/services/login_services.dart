import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServices extends ChangeNotifier {


  final googleSignIn = GoogleSignIn();


  Future<bool> googleSignInTo() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return false;
    } else {
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    }
  }

  Future signOut() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}