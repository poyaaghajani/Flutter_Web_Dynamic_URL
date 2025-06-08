import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/club_category/data/models/by_club_id_model.dart';
import 'package:aloplay_simulation/features/club_category/data/models/by_parent_id_model.dart';
import 'package:aloplay_simulation/features/club_category/data/models/club_categories_model.dart';
import 'package:dio/dio.dart';

abstract class IClubCategoryDatasource {
  Future<ClubCategoriesModel> getClubCategories(int page, String? searchKey);
  Future<ClubCategoryModel> getClubCategoryById();
  Future<List<ClubCategoryByClubIdModel>> getByClubId(int clubId);
  Future<List<ClubCategoryByParentIdModel>> getByParentId();
}

class ClubCategoryRemoteDatasource extends IClubCategoryDatasource {
  final Dio dio;
  final StorageManager storageManager;

  ClubCategoryRemoteDatasource(this.dio, this.storageManager);

  // get club categories
  @override
  Future<ClubCategoriesModel> getClubCategories(
    int page,
    String? searchKey,
  ) async {
    try {
      var response = await dio.get(
        'v1/ClubCategory/Get',
        queryParameters: {'page': page, 'searchKey': searchKey},
      );
      return ClubCategoriesModel.fromJson(response.data['data']);
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  // get by Id
  @override
  Future<ClubCategoryModel> getClubCategoryById() async {
    int? clubCategoryId = await storageManager.getClubCategoryId();

    try {
      var response = await dio.get(
        'v1/ClubCategory/GetById',
        queryParameters: {'id': clubCategoryId},
      );
      return ClubCategoryModel.fromJson(response.data['data']);
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  /// Get by clubId
  @override
  Future<List<ClubCategoryByClubIdModel>> getByClubId(int clubId) async {
    try {
      var response = await dio.get(
        'v1/ClubCategory/GetByClubId',
        queryParameters: {'clubId': clubId},
      );
      return response.data['data']
          .map<ClubCategoryByClubIdModel>(
            (jsonObject) => ClubCategoryByClubIdModel.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  /// Get by parentId
  @override
  Future<List<ClubCategoryByParentIdModel>> getByParentId() async {
    int? clubCategoryId = await storageManager.getClubCategoryId();

    try {
      var response = await dio.get(
        'v1/ClubCategory/GetByParentId',
        queryParameters: {'id': clubCategoryId},
      );
      return response.data['data']
          .map<ClubCategoryByParentIdModel>(
            (jsonObject) => ClubCategoryByParentIdModel.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }
}
