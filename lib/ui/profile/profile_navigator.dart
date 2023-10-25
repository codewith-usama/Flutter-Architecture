import 'package:architecture/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'profile_initial_params.dart';
import 'profile_page.dart';

class ProfileNavigator {}

mixin ProfileRoute {
  openProfile(ProfileInitialParams initialParams) {
    navigator.push(
      context,
      ProfilePage(initialParams: initialParams),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
