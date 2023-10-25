import 'package:architecture/domain/failure/users_list_failure.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/data/user_json.dart';
import 'package:architecture/network/network_repository.dart';
import 'package:dartz/dartz.dart';

class RestApiUsersRepository implements UsersRepository {
  final NetworkRepository _networkRepository;
  RestApiUsersRepository(this._networkRepository);
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() =>
      _networkRepository.get('https://jsonplaceholder.typicode.com/users').then(
            (value) => value.fold(
              (l) => left(
                UsersListFailure(error: l.error),
              ),
              (r) {
                var list = r as List;
                return right(
                  list.map((e) => UserJson.fromJson(e).toDomain()).toList(),
                );
              },
            ),
          );
}
