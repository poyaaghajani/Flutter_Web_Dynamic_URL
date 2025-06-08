import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/coach/data/datasource/coach_datasource.dart';
import 'package:aloplay_simulation/features/coach/data/models/coaches_model.dart';
import 'package:aloplay_simulation/features/coach/data/models/single_coach_model.dart';
import 'package:aloplay_simulation/features/coach/data/params/get_coach_params.dart';
import 'package:dartz/dartz.dart';

abstract class IPublicCoachRepository {
  Future<Either<String, PublicCoachesModel>> getAllCoaches(
    GetCoachesParams params,
  );
  Future<Either<String, PublicSingleCoachModel>> getCoach(int id);
}

class PublicCoachRepository extends IPublicCoachRepository {
  final IPublicCoachDatasource datasource;
  PublicCoachRepository(this.datasource);

  // get all coaches
  @override
  Future<Either<String, PublicCoachesModel>> getAllCoaches(
    GetCoachesParams params,
  ) async {
    try {
      var response = await datasource.getAllCoaches(params);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  // get coach by ID
  @override
  Future<Either<String, PublicSingleCoachModel>> getCoach(int id) async {
    try {
      var response = await datasource.getCoach(id);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }
}
