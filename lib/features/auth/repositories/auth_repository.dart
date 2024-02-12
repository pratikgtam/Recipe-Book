import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository();

  Future<void> signup({required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> emailPasswordLogin({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword({required String email}) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
