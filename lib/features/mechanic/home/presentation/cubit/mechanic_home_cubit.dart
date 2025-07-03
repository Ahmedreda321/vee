
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../domain/usecases/get_maintenance_use_case.dart';
import 'mechanic_home_state.dart';

class MechanicHomeCubit extends Cubit<MechanicHomeState> {
  final GetMaintenanceUseCase _getMaintenanceUseCase;
  MechanicHomeCubit(
    this._getMaintenanceUseCase,
  ) : super(const MechanicHomeState.initial());

  void getMechanicHomeData() {
    emit(const MechanicHomeState.loading());
    _getMaintenanceUseCase(NoParams()).then((result) {
      result.fold(
        (failure) => emit(MechanicHomeState.error(failure.message)),
        (data) => emit(MechanicHomeState.loaded(data)),
      );
    });
  }
}
