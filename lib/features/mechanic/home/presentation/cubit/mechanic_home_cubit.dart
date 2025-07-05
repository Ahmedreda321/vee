// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../data/models/finish_repair_model.dart';
import '../../data/models/start_repair_model.dart';
import '../../domain/usecases/finish_repair_use_case.dart';
import '../../domain/usecases/get_maintenance_use_case.dart';
import '../../domain/usecases/get_parts_use_case.dart';
import '../../domain/usecases/start_repair_use_case.dart';
import 'mechanic_home_state.dart';

class MechanicHomeCubit extends Cubit<MechanicHomeState> {
  final GetMaintenanceUseCase _getMaintenanceUseCase;
  final GetPartsUseCase _getPartsUseCase;
  final StartRepairUseCase _startRepairUseCase;
  final FinishRepairUseCase _finishRepairUseCase;

  MechanicHomeCubit(
    this._getMaintenanceUseCase,
    this._getPartsUseCase,
    this._startRepairUseCase,
    this._finishRepairUseCase,
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

  void getParts() {
    emit(const MechanicHomeState.getPartsLoading());
    _getPartsUseCase(NoParams()).then((result) {
      result.fold(
        (failure) => emit(MechanicHomeState.getPartsError(failure.message)),
        (data) => emit(MechanicHomeState.getPartsLoaded(data)),
      );
    });
  }

  void startRepair(StartRepairModel startRepairModel) {
    emit(const MechanicHomeState.startRepairLoading());
    _startRepairUseCase(startRepairModel).then((result) {
      result.fold(
          (failure) =>
              emit(MechanicHomeState.startRepairError(failure.message)),
          (data) {
        emit(const MechanicHomeState.startRepairSuccess(
            "Start repair successfully"));
        getMechanicHomeData();
      });
    });
  }

  void finish(FinishRepairModel finishRepairModel) {
    emit(const MechanicHomeState.finishRepairLoading());
    _finishRepairUseCase(finishRepairModel).then((result) {
      result.fold(
          (failure) =>
              emit(MechanicHomeState.finishRepairError(failure.message)),
          (data) {
        emit(const MechanicHomeState.finishRepairSuccess(
            "Finish repair successfully"));
        getMechanicHomeData();
      });
    });
  }
}
