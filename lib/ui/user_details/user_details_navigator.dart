import 'package:architecture/main.dart';
import 'package:architecture/navigation/app_navigator.dart';
import 'package:architecture/ui/user_details/user_details_initial_params.dart';
import 'package:architecture/ui/user_details/user_details_page.dart';
import 'package:flutter/material.dart';

class UserDetailsNavigator {}

mixin UserDetatailsRoute {
  openUserDetails(UserDetailsInitialParams initialParams) {
    navigator.push(
      context,
      UserDetailsPage(
        cubit: getIt(param1: initialParams),
      ),
    );
  }

  BuildContext get context;

  AppNavigator get navigator;
}
