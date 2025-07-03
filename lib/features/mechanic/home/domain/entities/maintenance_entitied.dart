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

  MaintenanceEntity({
    required this.id,
    required this.category,
    required this.maintenaceCategory,
    required this.vehicle,
    required this.description,
    required this.status,
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


