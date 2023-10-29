import 'package:architecture/data/firebase_user_json.dart';
import 'package:architecture/domain/failure/get_user_failure.dart';
import 'package:architecture/domain/failure/update_user_failure.dart';
import 'package:architecture/domain/failure/users_list_failure.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/domain/entites/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseUsersRepository implements UsersRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async => right(
        [
          const User(
            id: "123",
            name: 'name',
            username: 'username',
            email: 'email',
            phone: 'phone',
            website: 'website',
          ),
        ],
      );

  @override
  Future<Either<UpdateUserFailure, bool>> updateUser(User user) async {
    final userJson = FirebaseUserJson(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      phone: user.phone,
    );
    try {
      await db
          .collection("users")
          .doc(user.id)
          .set(userJson.toJson(), SetOptions(merge: true));

      return right(true);
    } catch (ex) {
      return left(
        UpdateUserFailure(
          error: ex.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<GetUserFailure, User>> getUserByEmail(String email) async {
    try {
      var snapshots =
          await db.collection("users").where('email', isEqualTo: email).get();
      return right(
          FirebaseUserJson.fromJson(snapshots.docs.first.data()).toDomain());
    } catch (ex) {
      return left(GetUserFailure(error: ex.toString()));
    }
  }
}
