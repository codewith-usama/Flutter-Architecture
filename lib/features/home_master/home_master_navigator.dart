import 'package:architecture/features/home_master/home_master_initial_params.dart';
import 'package:architecture/features/home_master/home_master_page.dart';
import 'package:flutter/material.dart';
import 'package:architecture/main.dart';
import 'package:architecture/navigation/app_navigator.dart';

class HomeMasterNavigator {}

mixin HomeMasterRoute {
  openHomeMaster(HomeMasterInitialParams initialParams) {
    navigator.push(
      context,
      HomeMasterPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
