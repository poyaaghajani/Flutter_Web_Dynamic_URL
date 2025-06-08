import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/coach/data/models/coaches_model.dart';
import 'package:aloplay_simulation/features/coach/data/models/single_coach_model.dart';
import 'package:aloplay_simulation/features/coach/data/params/get_coach_params.dart';
import 'package:dio/dio.dart';

abstract class IPublicCoachDatasource {
  Future<PublicCoachesModel> getAllCoaches(GetCoachesParams params);
  Future<PublicSingleCoachModel> getCoach(int id);
}

class PublicCoachRemoteDatasource extends IPublicCoachDatasource {
  final Dio dio;
  final StorageManager storageManager;

  PublicCoachRemoteDatasource(this.dio, this.storageManager);

  // get all coaches
  @override
  Future<PublicCoachesModel> getAllCoaches(GetCoachesParams params) async {
    int? clubCategoryId = await storageManager.getInt('club_category_id');

    try {
      var response = await dio.get(
        'v1/Coach/Get',
        queryParameters: {
          'page': params.page,
          'searchKey': params.searchKey,
          'userId': params.userId,
          'levels': params.levels,
          'cityIds': params.cityIds,
          'clubId': params.clubId,
          'clubCategoryId': clubCategoryId,
        },
      );

      return PublicCoachesModel.fromJson(response.data['data']);
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  // get coach by ID
  @override
  Future<PublicSingleCoachModel> getCoach(int id) async {
    try {
      var response = await dio.get(
        'v1/Coach/GetById',
        queryParameters: {'id': id},
      );

      return PublicSingleCoachModel.fromJson(response.data['data']);
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }
}
