import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

late GoogleSignInAccount? gUser;
late GoogleSignInAuthentication gAuth;
String idToken = "";

class FirebaseUser {}

class AuthService {
  Future signInWithGoogle() async {
    gUser = await GoogleSignIn().signIn();
    gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> checkSignedIn() async {
    var user = await signInWithGoogle();

    if (user != null) {
      idToken = FirebaseAuth.instance.currentUser!.uid.toString();
      return true;
    } else {
      return false;
    }
  }

  signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
