import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/failure/login_failure.dart';
import 'package:architecture/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<Either<LoginFailure, User>> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = fb.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var fbUser =
          await fb.FirebaseAuth.instance.signInWithCredential(credential);

      return right(const User.empty().copywith(
        id: fbUser.user!.uid,
        name: fbUser.user!.displayName ?? '',
        username: fbUser.user!.displayName ?? '',
        email: fbUser.user!.email ?? '',
        phone: fbUser.user!.phoneNumber ?? '',
      ));
    } catch (error) {
      return left(LoginFailure(error: error.toString()));
    }
  }
}
