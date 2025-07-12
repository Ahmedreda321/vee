import 'package:dartz/dartz.dart';
import 'package:vee/core/errors/failures.dart';
import 'package:vee/core/services/logger_service.dart';
import 'package:vee/features/driver/reports/data/mapper/dreiver_reports_mapper.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/network/error_handeler.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/utils/app_shared_pref_consts.dart';
import '../../../../../core/utils/app_shared_preferences.dart';
import '../../domain/entities/driver_reports_entites.dart';
import '../../domain/repositories/driver_reports_repository.dart';
import '../datasources/reports_remot_data_source.dart';

class DriverReportsRepositoryImpl implements DriverReportsRepository {
  final ReportsRemotDataSource _reportsRemotDataSource;
  final NetworkInfo _networkInfo;

  DriverReportsRepositoryImpl(this._reportsRemotDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<DriverReportsEntites>>> getDriverReports() async {
    final userId =
        await AppPreferences.getSecureData(AppSharedPrefConsts.userId);
    if (await _networkInfo.isConnected) {
      try {
        final response = await _reportsRemotDataSource.getDriverReports(
            userId ?? '', AppConstants.sotredBy);
        if (response.isNotEmpty) {
          AppLogger.f(response);
          final reportsList =
              response.map((report) => report.toDomain()).toList();
          return Right(reportsList);
        } else {
          return Left(ServerFailure());
        }
      } catch (e) {
        AppLogger.f(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
