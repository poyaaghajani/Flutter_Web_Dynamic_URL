import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/club/data/models/club_model.dart';
import 'package:aloplay_simulation/features/club/data/models/single_club.dart';
import 'package:aloplay_simulation/features/club/data/params/public_club_params.dart';
import 'package:dio/dio.dart';

abstract class IPublicClubDatasource {
  Future<PublicClubModel> getAllPublicClubs(PublicClubGetParams params);
  Future<SinglePublicClubModel> getPublicClubById(int clubId);
}

class PublicClubRemoteDatasource extends IPublicClubDatasource {
  final Dio dio;
  final StorageManager storageManager;
  PublicClubRemoteDatasource(this.dio, this.storageManager);

  /// Get all public clubs (Active and Inactive Clubs)
  @override
  Future<PublicClubModel> getAllPublicClubs(PublicClubGetParams params) async {
    int? clubCategoryId = await storageManager.getClubCategoryId();

    try {
      var response = await dio.get(
        'v1/PublicClub/GetAll',
        queryParameters: {
          'page': params.page,
          'sort': params.sort,
          'clubId': params.clubId,
          'cityId': params.cityId,
          'coachId': params.coachId,
          'searchKey': params.searchKey,
          'userLat': params.userLat,
          'userLong': params.userLong,
          'clubCategoryId': clubCategoryId,
        },
      );
      return PublicClubModel.fromJson(response.data['data']);
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  // get single public club by id
  @override
  Future<SinglePublicClubModel> getPublicClubById(int clubId) async {
    try {
      var response = await dio.get(
        'v1/PublicClub/GetById',
        queryParameters: {'clubId': clubId},
      );
      return SinglePublicClubModel.fromJson(response.data['data']);
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }
}
