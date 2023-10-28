import 'package:architecture/domain/failure/get_local_storage_failure.dart';
import 'package:architecture/domain/failure/set_local_storage_failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocalStorageRepository {
  Future<Either<SetLocalStorageFailure, bool>> setString(
      String key, String value);

  Future<Either<GetLocalStorageFailure, String>> getString(String key);

  Future<Either<SetLocalStorageFailure, bool>> setBool(String key, bool value);

  Future<Either<GetLocalStorageFailure, bool>> getBool(String key);
}
