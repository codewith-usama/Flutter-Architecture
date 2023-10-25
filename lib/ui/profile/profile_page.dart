import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_cubit.dart';
import 'profile_initial_params.dart';

class ProfilePage extends StatefulWidget {
  final ProfileInitialParams initialParams;

  const ProfilePage({
    Key? key,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<ProfileCubit>(context);
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox(),
    );
  }
}
