import 'package:wesave/ressource/export.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user from firebase
  AppUser? _userfromfirebase(user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  //creaction du stream qui est un getter permettant de recuperer des données il a deux types streamsubscriptionn et broadcast
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userfromfirebase);
  }

  //sign anon
  // ignore: non_constant_identifier_names
  Future signInAnon() async {
    try {
      final UserCredential result = await _auth.signInAnonymously();
      final User? user = result.user;
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign email and password
  Future signInWitchEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign up email and password
  Future signUpWitchEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;

      // await DatabaseService(uid: user!.uid).UpdateUserData(
      //   "boton","medard","masculin","age"
      // );
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logout
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}