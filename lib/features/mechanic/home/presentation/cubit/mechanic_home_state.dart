import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vee/features/mechanic/home/domain/entities/maintenance_entitied.dart';

part 'mechanic_home_state.freezed.dart';

@freezed
class MechanicHomeState<T> with _$MechanicHomeState<T> {
  const factory MechanicHomeState.initial() = _Initial;
  const factory MechanicHomeState.loading() = Loading;
  const factory MechanicHomeState.loaded(MechanicHomeEntities data) = Loaded;
  const factory MechanicHomeState.error(String message) = Error;
}
