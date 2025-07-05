import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vee/features/mechanic/home/domain/entities/maintenance_entitied.dart';

import '../../data/models/part_model.dart';

part 'mechanic_home_state.freezed.dart';

@freezed
class MechanicHomeState<T> with _$MechanicHomeState<T> {
  const factory MechanicHomeState.initial() = _Initial;
  const factory MechanicHomeState.loading() = Loading;
  const factory MechanicHomeState.loaded(MechanicHomeEntities data) = Loaded;
  const factory MechanicHomeState.error(String message) = Error;

  // Get Parts States
  const factory MechanicHomeState.getPartsLoading() = GetPartsLoading;
  const factory MechanicHomeState.getPartsLoaded(List<PartModel> data) =
      GetPartsLoaded;
  const factory MechanicHomeState.getPartsError(String message) = GetPartsError;

  // Start Repair States
  const factory MechanicHomeState.startRepairLoading() = StartRepairLoading;
  const factory MechanicHomeState.startRepairSuccess(String message) =
      StartRepairSuccess;
  const factory MechanicHomeState.startRepairError(String message) =
      StartRepairError;
  // Finish Repair States
  const factory MechanicHomeState.finishRepairLoading() = FinishRepairLoading;
  const factory MechanicHomeState.finishRepairSuccess(String message) =
      FinishRepairSuccess;
  const factory MechanicHomeState.finishRepairError(String message) =
      FinishRepairError;    
}
