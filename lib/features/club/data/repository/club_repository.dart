import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/club/data/datasource/club_datasource.dart';
import 'package:aloplay_simulation/features/club/data/models/club_model.dart';
import 'package:aloplay_simulation/features/club/data/models/single_club.dart';
import 'package:aloplay_simulation/features/club/data/params/public_club_params.dart';
import 'package:dartz/dartz.dart';

abstract class IPublicClubRepository {
  Future<Either<String, PublicClubModel>> getAllPublicClubs(
    PublicClubGetParams params,
  );
  Future<Either<String, SinglePublicClubModel>> getPublicClubById(int clubId);
}

class PublicClubRepository extends IPublicClubRepository {
  IPublicClubDatasource datasource;
  PublicClubRepository(this.datasource);

  /// Get all public clubs (Active and Inactive Clubs)
  @override
  Future<Either<String, PublicClubModel>> getAllPublicClubs(
    PublicClubGetParams params,
  ) async {
    try {
      var allClubs = await datasource.getAllPublicClubs(params);
      return right(allClubs);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  // get single public club by id
  @override
  Future<Either<String, SinglePublicClubModel>> getPublicClubById(
    int clubId,
  ) async {
    try {
      var club = await datasource.getPublicClubById(clubId);
      return right(club);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }
}
