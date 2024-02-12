import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_book/features/auth/services/google_sso.dart';

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

  Future<String?> googleLogin() async {
    final OAuthCredential credential = await GoogleSSO.signIn();

    final result = await FirebaseAuth.instance.signInWithCredential(credential);

    final token = await result.user?.getIdToken();

    return token;
  }

  Future<void> resetPassword({required String email}) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
