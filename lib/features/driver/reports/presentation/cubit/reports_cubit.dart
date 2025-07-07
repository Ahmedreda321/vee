import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../domain/usecases/get_driver_reports_use_case.dart';
import 'reports_state.dart';

class DriverReportsCubit extends Cubit<DriverReportsState> {
  final GetDriverReportsUseCase getDriverReportsUseCase;
  DriverReportsCubit(this.getDriverReportsUseCase):super(const DriverReportsState.initial());

  Future<void> getDriverReports() async {
    emit(const DriverReportsState.loading());
    final result = await getDriverReportsUseCase(NoParams());
    result.fold(
        (failure) => emit(DriverReportsState.error(message: failure.message)),
        (data) {
      emit(DriverReportsState.loaded(data: data));
    });
  }
}
