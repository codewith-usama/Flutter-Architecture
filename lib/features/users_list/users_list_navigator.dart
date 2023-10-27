import 'package:architecture/features/users_list/users_list_initial_params.dart';
import 'package:architecture/main.dart';
import 'package:architecture/navigation/app_navigator.dart';
import 'package:architecture/features/user_details/user_details_navigator.dart';
import 'package:architecture/features/users_list/users_list_page.dart';
import 'package:flutter/material.dart';

class UsersListNavigator with UserDetatailsRoute {
  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;

  UsersListNavigator(this.navigator);
}

mixin UsersListRoute {
  openUsersList(UserListInitialParams initialParams) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsersListPage(
          cubit: getIt(
            param1: initialParams,
          ),
        ),
      ),
    );
  }

  BuildContext get context;
}
