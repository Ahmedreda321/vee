import '../../domain/entities/driver_reports_entites.dart';
import '../models/reports_respons_models.dart';

extension DriverReportsMapper on DriverReportsBaseRespons {
  DriverReportsEntites toDomain() {
    String time = '';
    String datePart = '';
    //TODO :  maybe Refactor this
    if (reportedAt != null && reportedAt!.isNotEmpty) {
      try {
        final dateTime = DateTime.parse(reportedAt!);
        datePart = '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
        time = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        datePart = reportedAt!;
        time = '';
      }
    }
    return DriverReportsEntites(
      date: datePart,
      decription: vehicle?.vehicleModelDto.category.description ?? '',
      driverName: driver?.displayName ?? '',
      id: id ?? '',
      status: status ?? '',
      vehicleNumber: vehicle?.palletNumber ?? '',
    );
  }
}
