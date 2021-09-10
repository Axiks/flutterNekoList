import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth? firebaseAuth})
  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    // return await _firebaseAuth.createUserWithEmailAndPassword(email: "", password: "");
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future<bool> isSignedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();
      return true;
    }
    return false;
    // return user != null;
  }

  Future<User?> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

}