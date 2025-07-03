import 'package:dartz/dartz.dart';
import 'package:vee/features/mechanic/home/data/mapper/mechanic_home_mapper.dart';

import 'package:vee/features/mechanic/home/domain/entities/maintenance_entitied.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/error_handeler.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repositories/mechanic_home_repository.dart';
import '../datasources/mechanic_home_remot_data_source.dart';

class MechanicHomeRepositoryImpl implements MechanicHomeRepository {
  final MechanicHomeRemotDataSource _mechanicHomeRemotDataSource;
  final NetworkInfo _networkInfo;

  MechanicHomeRepositoryImpl(
      this._mechanicHomeRemotDataSource, this._networkInfo, );
  @override
  Future<Either<Failure, MechanicHomeEntities>> getMaintenance() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _mechanicHomeRemotDataSource.getMaintenance();
        if (response.statusCode == ResponseCode.SUCCESS) {
          final maintenance = response.maintenances
              .map((maintenance) => maintenance.toDomain())
              .toList().sortedByStatus();
          return Right(MechanicHomeEntities(maintenanceEntities: maintenance));
        } else {
          return Left(
            ErrorHandler.handle(
              Failure(response.message ?? ResponseMessage.DEFAULT,
                  response.statusCode ?? ResponseCode.DEFAULT),
            ).failure,
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
