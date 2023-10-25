import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/failure/login_failure.dart';
import 'package:architecture/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SocialLoginUseCase {
  final AuthRepository _authRepository;
  SocialLoginUseCase(this._authRepository);
  Future<Either<LoginFailure, User>> execute() async {
    return _authRepository.login();
  }
}
