import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/failure/login_failure.dart';
import 'package:architecture/domain/repositories/auth_repository.dart';
import 'package:architecture/domain/repositories/local_storage_repository.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/domain/stores/user_store.dart';
import 'package:dartz/dartz.dart';

class SocialLoginUseCase {
  final AuthRepository _authRepository;
  final UserStore userStore;
  final UsersRepository usersRepository;
  final LocalStorageRepository localStorageRepository;

  SocialLoginUseCase(
    this._authRepository,
    this.userStore,
    this.usersRepository,
    this.localStorageRepository,
  );

  Future<Either<LoginFailure, User>> execute() => _authRepository.login().then(
        (value) => value.fold(
          (l) => left(l),
          (user) {
            return usersRepository.updateUser(user).then(
                  (value) => value.fold(
                    (failure) => left(
                      LoginFailure(error: failure.error),
                    ),
                    (r) => localStorageRepository
                        .setString('USER_EMAIL', user.email)
                        .then(
                          (value) => value.fold(
                            (l) => left(LoginFailure(error: l.error)),
                            (r) {
                              userStore.setUser(user);
                              return right(user);
                            },
                          ),
                        ),
                  ),
                );
          },
        ),
      );
}
