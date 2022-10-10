import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _facebookSignIn = FacebookAuth.instance;
  bool _isSignedInFacebook = false;

  UserCredential? user;

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        user = await _auth.signInWithCredential(credential);
        return user;
      }
    } on FirebaseAuthException catch (err) {
      print(err.message);
      throw err;
    }
  }

  loginWithFacebook() async {
    try {
      await _facebookSignIn
          .login(permissions: ["public_profile", "email"]).then((value) async {
        if (value.status == LoginStatus.success) {
          _isSignedInFacebook = true;
          final AuthCredential credential =
              FacebookAuthProvider.credential(value.accessToken!.token);
          user = await _auth.signInWithCredential(credential);
          print(user);
          return user;
        }
      });
    } on FirebaseAuthException catch (err) {
      print(err.message);
      throw err;
    }
  }

  signOut() async {
    if (_isSignedInFacebook) {
      await FacebookAuth.instance.logOut().then((value) {
        _isSignedInFacebook = false;
      });
      print("User Sign Out Facebook Correcto");
    } else {
      await _googleSignIn.signOut();
      print("User Sign Out Google Correcto");
    }
    await _auth.signOut();
    user = null;
  }

  Auth._privateConstructor();

  static final Auth _instance = Auth._privateConstructor();

  static Auth get instance => _instance;
}
