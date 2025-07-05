// mechanic_home_mapper.dart
import 'package:vee/features/mechanic/home/data/models/part_model.dart';

import '../../domain/entities/maintenance_entitied.dart';
import '../models/maintenance_respons.dart';

extension VehicleResponseMapper on VehicleResponse {
  VehicleEntity toDomain() {
    return VehicleEntity(
      name: name ?? '',
      palletNumber: palletNumber ?? '',
      category: category ?? '',
    );
  }
}

extension MechanicResponseMapper on MaintenanceResponse {
  MaintenanceEntity toDomain() {
    return MaintenanceEntity(
       initialReport?.toDomain() ?? InitialReportIdEntity(initialReportId: ''),
      maintenaceCategory: maintenaceCategory ?? '', 
      description: description ?? '',
      vehicle: vehicle?.toDomain() ??
          VehicleEntity(name: '', palletNumber: '', category: ''),
      status: status ?? '', id: id ?? '', category: maintenaceCategory ?? '',
      parts: parts?.map((part) => part.toDomain()).toList() ?? [],
      
    );
  }
}

extension PartResponseMapper on PartModel {
  PartEntity toDomain() {
    return PartEntity(
      id: id ?? '',
      quantity: quantity ?? 0,
    );
  }
  
}

extension MaintenanceListSorter on List<MaintenanceEntity> {
  void sortByStatus() {
    final statusOrder = {
      'in_progress': 1,
      'pending': 2,
      'finished': 3,
    };

    sort((a, b) {
      final orderA = statusOrder[a.status] ?? 4;
      final orderB = statusOrder[b.status] ?? 4;
      return orderA.compareTo(orderB);
    });
  }
}

extension MaintenanceListSorte on List<MaintenanceEntity> {
  List<MaintenanceEntity> sortedByStatus() {
    final sortedList = [...this];
    sortedList.sortByStatus();
    return sortedList;
  }
}

extension InitialReportIdMapper on InitialReport {
  InitialReportIdEntity toDomain() {
    return InitialReportIdEntity(
      initialReportId: id ?? '',
    );
  }
}