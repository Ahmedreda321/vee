import '../../../../../core/constants/strings_constants.dart';
import '../../domain/entities/driver_home_entities.dart';
import '../models/trip_model.dart';


extension TripEntitySorting on List<TripEntity> {
  List<TripEntity> sortTrips() {
    return this..sort((a, b) {
      if (a.status == AppStrings.pending && b.status != AppStrings.pending) {
        return -1;
      } else if (a.status != AppStrings.pending && b.status == AppStrings.pending) {
        return 1;
      } else {
        return 0; 
      }
    });
  }
}

extension TripResponseMapper on TripResponse {
  TripEntity toDomain() {
    String datePart = '';
    String time = '';
    //TODO :  maybe Refactor this
    if (date != null && date!.isNotEmpty) {
      try {
        final dateTime = DateTime.parse(date!);
        datePart = '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
        time = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        datePart = date!;
        time = '';
      }
    }
    return TripEntity(
      id: id ?? '',
      managerId: managerId ?? '',
      details: details ?? '',
      destination: destination ?? '',
      tripType: tripType ?? '',
      date: datePart,
      time: time,
      driver: driver?.toDomain() ?? const TripDriverEntity(id: '', name: ''),
      vehicle: vehicle?.toDomain() ?? const VehicleEntity(id: '', palletNumber: '', vehicleModel: VehicleModelEntity(id: '', name: '', fuelEfficiency: '', brand: BrandEntity(id: '', name: '', country: ''), category: CategoryEntity(id: '', name: '', description: ''))),
      status: status ?? '',
      pickupLocation: pickupLocation ?? '',
      pickupLocationLatitude: pickupLocationLatitude ?? 0.0,
      pickupLocationLongitude: pickupLocationLongitude ?? 0.0,
      destinationLatitude: destinationLatitude ?? 0.0,
      destinationLongitude: destinationLongitude ?? 0.0,
    );
  }
}

extension TripDriverResponseMapper on TripDriverResponse {
  TripDriverEntity toDomain() {
    return TripDriverEntity(
      id: id ?? '',
      name: name ?? '',
    );
  }
}
extension VehicleResponseMapper on VehicleResponse {
  VehicleEntity toDomain() {
    return VehicleEntity(
      id: id ?? '',
      palletNumber: palletNumber ?? '',
      vehicleModel: vehicleModelDto?.toDomain() ?? const VehicleModelEntity(id: '', name: '', fuelEfficiency: '', brand: BrandEntity(id: '', name: '', country: ''), category: CategoryEntity(id: '', name: '', description: '')),
    );
  }
}
extension VehicleModelDtoResponseMapper on VehicleModelDtoResponse {
  VehicleModelEntity toDomain() {
    return VehicleModelEntity(
      id: id ?? '',
      name: name ?? '',
      fuelEfficiency: fuelEfficiency ?? '',
      brand: brand?.toDomain() ?? const BrandEntity(id: '', name: '', country: ''),
      category: category?.toDomain() ?? const CategoryEntity(id: '', name: '', description: ''),
    );
  }
}
extension CategoryResponseMapper on CategoryResponse {
  CategoryEntity toDomain() {
    return CategoryEntity(
      id: id ?? '',
      name: name ?? '',
      description: description ?? '',
    );
  }
}
extension BrandResponseMapper on BrandResponse {
  BrandEntity toDomain() {
    return BrandEntity(
      id: id ?? '',
      name: name ?? '',
      country: country ?? '',
    );
  }
}


