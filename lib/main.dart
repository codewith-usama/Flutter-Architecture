import 'package:architecture/data/rest_api_users_repository.dart';
import 'package:architecture/domain/repositories/users_repository.dart';
import 'package:architecture/navigation/app_navigator.dart';
import 'package:architecture/network/network_repository.dart';
import 'package:architecture/ui/user_details/user_details_cubit.dart';
import 'package:architecture/ui/user_details/user_details_initial_params.dart';
import 'package:architecture/ui/users_list/users_list_initial_params.dart';
import 'package:architecture/ui/users_list/users_list_navigator.dart';
import 'package:architecture/ui/users_list/users_list_page.dart';
import 'package:architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository(getIt()));

  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));

  getIt.registerFactoryParam<UsersListCubit, UserListInitialParams, dynamic>(
    (param1, _) => UsersListCubit(
      param1,
      getIt(),
      getIt(),
    )..fetchUsers(),
  );

  getIt.registerFactoryParam<UserDetailsCubit, UserDetailsInitialParams,
      dynamic>(
    (param1, _) => UserDetailsCubit(
      param1,
    ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersListPage(cubit: getIt(param1: const UserListInitialParams())),
    );
  }
}
