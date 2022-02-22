import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  FirebaseAuth auth;
  LoginService({required this.auth});
  Stream<User?> get user => auth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential user = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }
}
