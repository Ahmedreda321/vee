import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vee/features/driver/home/domain/usecases/fault_report_use_case.dart';

import '../../../data/models/fault_report_model.dart';
import '../../../data/models/trip_report_model.dart';
import '../../../domain/usecases/report_trip_use_case.dart';
import 'map_screen_state.dart';

class MapScreenCubit extends Cubit<MapScreenState> {
  final ReportTripUseCase reportTripUseCase;
  final FaultReportUseCase faultReportUseCase;
  MapScreenCubit(
    this.reportTripUseCase, this.faultReportUseCase,
  ) : super(const MapScreenState.initial());

  final costController = TextEditingController();
  final detailsController = TextEditingController();
  final fuelRefileController = TextEditingController();
  // for fault
  final faultTypeController = TextEditingController();
  final addressController = TextEditingController();
  final faultDetailsController = TextEditingController(); // for fault details
  final faultCostController = TextEditingController();
  final faultFuelRefillController = TextEditingController();

  void reportTrip( TripReportModel tripReportModel) async{
    emit(const MapScreenState.reportLoading());
   await reportTripUseCase(tripReportModel).then((result) {
      result.fold(
        (failure) => emit(MapScreenState.reportError(failure.message)),
        (data) => emit(const MapScreenState.reportLoaded()),
      );
    });
  }

  void faultReport( FaultReportModel faultReportModel) async{
    emit(const MapScreenState.reportLoading());
   await faultReportUseCase(faultReportModel).then((result) {
      result.fold(
        (failure) => emit(MapScreenState.reportError(failure.message)),
        (data) => emit(const MapScreenState.reportLoaded()),
      );
    });
    
  }

  @override
  Future<void> close() {
    addressController.dispose();
    faultTypeController.dispose();
    faultDetailsController.dispose();
    faultCostController.dispose();
    faultFuelRefillController.dispose();
    costController.dispose();
    detailsController.dispose();
    fuelRefileController.dispose();
    return super.close();
  }

  void clearControllers() {
    addressController.clear();
    faultTypeController.clear();
    faultDetailsController.clear();
    faultCostController.clear();
    faultFuelRefillController.clear();
    costController.clear();
    detailsController.clear();
    fuelRefileController.clear();
  }
}
