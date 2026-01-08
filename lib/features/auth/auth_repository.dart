import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  // Rejestracja nowego użytkownika
  Future<User?> signUp({required String email, required String password}) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  // Logowanie istniejącego użytkownika
  Future<User?> signIn({required String email, required String password}) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  // Wylogowanie
  Future<void> signOut() async {
    await _auth.signOut();
  }
}