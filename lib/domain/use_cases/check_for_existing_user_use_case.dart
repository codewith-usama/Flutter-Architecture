import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/failure/existing_user_failure.dart';
import 'package:architecture/domain/repositories/local_storage_repository.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/domain/stores/user_store.dart';
import 'package:dartz/dartz.dart';

class CheckForExistingUserUseCase {
  final UsersRepository _usersRepository;
  final LocalStorageRepository _localStorageRepository;
  final UserStore _userStore;

  CheckForExistingUserUseCase(
    this._usersRepository,
    this._localStorageRepository,
    this._userStore,
  );

  Future<Either<ExistingUserFailure, User>> execute() {
    return _localStorageRepository.getString('USER_EMAIL').then(
          (value) => value.fold(
            (l) => left(ExistingUserFailure(error: l.error)),
            (email) {
              if (email.isNotEmpty) {
                return _usersRepository.getUserByEmail(email).then(
                      (value) => value.fold(
                        (l) => left(ExistingUserFailure(error: l.error)),
                        (user) {
                          _userStore.setUser(user);
                          return right(user);
                        },
                      ),
                    );
              }
              return left(ExistingUserFailure(error: 'User doesn\'t exists'));
            },
          ),
        );
  }
}
