import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/product/data/models/all_products_model.dart';
import 'package:aloplay_simulation/features/product/data/models/available_time_model.dart';
import 'package:aloplay_simulation/features/product/data/models/by_time_model.dart';
import 'package:aloplay_simulation/features/product/data/models/gender_model.dart';
import 'package:aloplay_simulation/features/product/data/params/product_params.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasource {
  Future<List<ProductAvailableTimeModel>> getProductAvailableTimes(
    ProductParams params,
  );
  Future<List<ProductByTimeModel>> getProductByTime(ProductParams params);
  Future<ProductGenderModel> getProductGenders(int clubId);
  Future<List<AllProductsModel>> getAllProducts(int clubId);
}

class ProductRemoteDatasource extends IProductDatasource {
  final Dio dio;
  final StorageManager storageManager;

  ProductRemoteDatasource(this.dio, this.storageManager);

  // get product available times by date
  @override
  Future<List<ProductAvailableTimeModel>> getProductAvailableTimes(
    ProductParams params,
  ) async {
    int? clubCategoryId = await storageManager.getInt('club_category_id');

    try {
      var response = await dio.get(
        'v2/Product/GetAvailableTime',
        queryParameters: {
          'id': params.id,
          'date': params.date,
          'productGender': params.productGender,
          'clubCategoryId': clubCategoryId,
        },
      );
      return response.data['data']
          .map<ProductAvailableTimeModel>(
            (jsonObject) => ProductAvailableTimeModel.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  // get product by time
  @override
  Future<List<ProductByTimeModel>> getProductByTime(
    ProductParams params,
  ) async {
    int? clubCategoryId = await storageManager.getInt('club_category_id');

    try {
      var response = await dio.get(
        'v2/Product/GetByTime',
        queryParameters: {
          'clubId': params.id,
          'date': params.date,
          'time': params.time,
          'productGender': params.productGender,
          'clubCategoryId': clubCategoryId,
        },
      );
      return response.data['data']
          .map<ProductByTimeModel>(
            (jsonObject) => ProductByTimeModel.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  // get all product genders
  @override
  Future<ProductGenderModel> getProductGenders(int clubId) async {
    try {
      var response = await dio.get(
        'v1/Product/GetGenders',
        queryParameters: {'clubId': clubId},
      );
      return ProductGenderModel.fromJson(response.data);
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }

  // get all products
  @override
  Future<List<AllProductsModel>> getAllProducts(int clubId) async {
    try {
      var response = await dio.get(
        'v1/Product/GetAll',
        queryParameters: {'clubId': clubId},
      );
      return response.data['data']
          .map<AllProductsModel>(
            (jsonObject) => AllProductsModel.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw AppException(message: '', dioException: ex);
    } catch (_) {
      throw AppException(message: 'error');
    }
  }
}
