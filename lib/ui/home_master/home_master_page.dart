import 'package:flutter/material.dart';
import 'home_master_cubit.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Home')),
    );
  }
}
