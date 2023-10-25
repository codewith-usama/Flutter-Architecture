import 'package:architecture/domain/entites/user.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/ui/user_details/user_details_initial_params.dart';
import 'package:architecture/ui/users_list/users_list_initial_params.dart';
import 'package:architecture/ui/users_list/users_list_navigator.dart';
import 'package:architecture/ui/users_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final UsersRepository usersRepository;
  final UsersListNavigator navigator;
  final UserListInitialParams initialParams;
  UsersListCubit(
    this.initialParams,
    this.usersRepository,
    this.navigator,
  ) : super(UsersListState.initial());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true, error: null));
    final userResponse = await usersRepository.getUsers();
    userResponse.fold(
      (error) {
        // show dialog erro on UI
        // after we add navigation layer
        emit(state.copyWith(error: error.error));
      },
      (users) {
        emit(state.copyWith(users: users, isLoading: false));
      },
    );
  }

  onTapUser(User user) =>
      navigator.openUserDetails(UserDetailsInitialParams(user: user));
}
