import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/club_category/data/datasource/club_category_datasource.dart';
import 'package:aloplay_simulation/features/club_category/data/models/by_club_id_model.dart';
import 'package:aloplay_simulation/features/club_category/data/models/by_parent_id_model.dart';
import 'package:aloplay_simulation/features/club_category/data/models/club_categories_model.dart';
import 'package:dartz/dartz.dart';

abstract class IClubCategoryRepository {
  Future<Either<String, ClubCategoriesModel>> getClubCategories(
    int page,
    String? searchKey,
  );
  Future<Either<String, ClubCategoryModel>> getClubCategoryById();
  Future<Either<String, List<ClubCategoryByClubIdModel>>> getByClubId(
    int clubId,
  );
  Future<Either<String, List<ClubCategoryByParentIdModel>>> getByParentId();
}

class ClubCategoryRepository extends IClubCategoryRepository {
  final IClubCategoryDatasource datasource;
  ClubCategoryRepository(this.datasource);

  // get club categories
  @override
  Future<Either<String, ClubCategoriesModel>> getClubCategories(
    int page,
    String? searchKey,
  ) async {
    try {
      var response = await datasource.getClubCategories(page, searchKey);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  // get by Id
  @override
  Future<Either<String, ClubCategoryModel>> getClubCategoryById() async {
    try {
      var response = await datasource.getClubCategoryById();
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  /// Get by clubId
  @override
  Future<Either<String, List<ClubCategoryByClubIdModel>>> getByClubId(
    int clubId,
  ) async {
    try {
      var response = await datasource.getByClubId(clubId);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  /// Get by parentId
  @override
  Future<Either<String, List<ClubCategoryByParentIdModel>>>
  getByParentId() async {
    try {
      var response = await datasource.getByParentId();
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }
}
