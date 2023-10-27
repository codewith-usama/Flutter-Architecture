import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/failure/login_failure.dart';
import 'package:architecture/domain/repositories/auth_repository.dart';
import 'package:architecture/domain/stores/user_store.dart';
import 'package:dartz/dartz.dart';

class SocialLoginUseCase {
  final AuthRepository _authRepository;
  final UserStore userStore;
  SocialLoginUseCase(
    this._authRepository,
    this.userStore,
  );

  Future<Either<LoginFailure, User>> execute() => _authRepository.login().then(
        (value) => value.fold(
          (l) => left(l),
          (user) {
            userStore.setUser(user);
            return right(user);
          },
        ),
      );
}
