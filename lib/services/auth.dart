import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance; //Tillader kommunikation med firebase
  // //Anonym tilgang (IKKE SLÅET TIL)
  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return user;
  //   } catch(e) {

  //   }
  // }

  //log ind med email & Password

  //Registrere med email & PAssword

  //Log ud
}