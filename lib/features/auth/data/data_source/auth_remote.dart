import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemote {
  Future<String> signInWithGoogle();
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<String> signOut();
  Future<void> resetPassword(String email);
}

@LazySingleton(as: AuthRemote)
class AuthRemoteImplFirebase implements AuthRemote {
  final FirebaseAuth firebaseInstance = FirebaseAuth.instance;

  @override
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in failed');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return firebaseInstance.currentUser?.uid ?? '';
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await firebaseInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid ?? '';
    } catch (e) {
      throw Exception('Failed to sign in with email and password: $e');
    }
  }

  @override
  Future<String> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      final userCredential = await firebaseInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseInstance.currentUser?.updateProfile(displayName: name);
      return userCredential.user?.uid ?? '';
    } catch (e) {
      throw Exception('Failed to register with email and password: $e');
    }
  }

  @override
  Future<String> signOut() async {
    try {
      // Sign out from Firebase
      await firebaseInstance.signOut();
      // Sign out from Google
      await GoogleSignIn().signOut();
      return firebaseInstance.currentUser?.uid ?? '';
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await firebaseInstance.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to reset password: $e');
    }
  }
}
