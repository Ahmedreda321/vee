class DriverHomeEntities {
  final List<TripEntity> trips;

  DriverHomeEntities({required this.trips});
}

class TripEntity {
  final String id;
  final String managerId;
  final String details;
  final String destination;
  final String tripType;
  final String date;
  final String time;
  final TripDriverEntity driver;
  final VehicleEntity vehicle;
  final String status;
  final String pickupLocation;
  final double pickupLocationLatitude;
  final double pickupLocationLongitude;
  final double destinationLatitude;
  final double destinationLongitude;

  const TripEntity({
    required this.pickupLocation,
    required this.pickupLocationLatitude,
    required this.pickupLocationLongitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.time,
    required this.id,
    required this.managerId,
    required this.details,
    required this.destination,
    required this.tripType,
    required this.date,
    required this.driver,
    required this.vehicle,
    required this.status,
  });
  @override
  String toString() {
    return 'TripEntity(id: $id, managerId: $managerId, details: $details, destination: $destination, tripType: $tripType, date: $date, time: $time, driver: $driver, vehicle: $vehicle, status: $status, pickupLocation: $pickupLocation, pickupLocationLatitude: $pickupLocationLatitude, pickupLocationLongitude: $pickupLocationLongitude, destinationLatitude: $destinationLatitude, destinationLongitude: $destinationLongitude)';
  }
}

class TripDriverEntity {
  final String id;
  final String name;

  const TripDriverEntity({
    required this.id,
    required this.name,
  });
}

class VehicleEntity {
  final String id;
  final String palletNumber;
  final VehicleModelEntity vehicleModel;

  const VehicleEntity({
    required this.id,
    required this.palletNumber,
    required this.vehicleModel,
  });
}

class VehicleModelEntity {
  final String id;
  final String name;
  final String fuelEfficiency;
  final BrandEntity brand;
  final CategoryEntity category;

  const VehicleModelEntity({
    required this.id,
    required this.name,
    required this.fuelEfficiency,
    required this.brand,
    required this.category,
  });
}

class CategoryEntity {
  final String id;
  final String name;
  final String description;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
  });
}

class BrandEntity {
  final String id;
  final String name;
  final String country;

  const BrandEntity({
    required this.id,
    required this.name,
    required this.country,
  });
}
