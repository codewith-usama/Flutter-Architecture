import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_master_initial_params.dart';
import 'home_master_state.dart';

class HomeMasterCubit extends Cubit<HomeMasterState> {
  final HomeMasterInitialParams initialParams;

  HomeMasterCubit(this.initialParams)
      : super(HomeMasterState.initial(initialParams: initialParams));
}
