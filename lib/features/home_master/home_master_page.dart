import 'package:architecture/features/home_master/home_master_cubit.dart';
import 'package:architecture/features/home_master/home_master_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMasterPage extends StatefulWidget {
  final HomeMasterCubit cubit;

  const HomeMasterPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<HomeMasterPage> createState() => _HomeMasterState();
}

class _HomeMasterState extends State<HomeMasterPage> {
  HomeMasterCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.onInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as HomeMasterState;
            return Column(
              children: [
                Text(state.user.name),
                ListTile(
                  title: const Text('Dark Theme'),
                  trailing: Switch(
                    onChanged: cubit.onThemeChanged,
                    value: state.isDarkTheme,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
