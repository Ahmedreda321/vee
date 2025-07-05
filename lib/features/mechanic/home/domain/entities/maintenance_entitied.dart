// ignore_for_file: public_member_api_docs, sort_constructors_first
class MechanicHomeEntities {
  final List<MaintenanceEntity> maintenanceEntities;

  MechanicHomeEntities({required this.maintenanceEntities});
}

class MaintenanceEntity {
  final String id;
  final String category;
  final String maintenaceCategory;
  final VehicleEntity vehicle;
  final String description;
  final  String status;
  final List<PartEntity> parts;
  final InitialReportIdEntity? initialReportIdEntity;


  MaintenanceEntity(this.initialReportIdEntity, {
    required this.id,
    required this.category,
    required this.maintenaceCategory,
    required this.vehicle,
    required this.description,
    required this.status,
    required this.parts
  });

}


class VehicleEntity {
  final String name;
  final String palletNumber;
  final String category;
  VehicleEntity({
    required this.name,
    required this.palletNumber,
    required this.category,
  });
  
}

class PartEntity {
  final String id;
  final int quantity;
  
  PartEntity({
    required this.id,
    required this.quantity,
  });
}

class InitialReportIdEntity {
  final String initialReportId;
  InitialReportIdEntity({required this.initialReportId});
}