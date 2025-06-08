import 'package:aloplay_simulation/core/utils/exception/app_exeption.dart';
import 'package:aloplay_simulation/features/product/data/datasource/product_datasource.dart';
import 'package:aloplay_simulation/features/product/data/models/all_products_model.dart';
import 'package:aloplay_simulation/features/product/data/models/available_time_model.dart';
import 'package:aloplay_simulation/features/product/data/models/by_time_model.dart';
import 'package:aloplay_simulation/features/product/data/models/gender_model.dart';
import 'package:aloplay_simulation/features/product/data/params/product_params.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductAvailableTimeModel>>>
  getProductAvailableTimes(ProductParams params);
  Future<Either<String, List<ProductByTimeModel>>> getProductByTime(
    ProductParams params,
  );
  Future<Either<String, ProductGenderModel>> getProductGenders(int clubId);
  Future<Either<String, List<AllProductsModel>>> getAllProducts(int clubId);
}

class ProductRepository extends IProductRepository {
  final IProductDatasource datasource;
  ProductRepository(this.datasource);

  // get product available times by date
  @override
  Future<Either<String, List<ProductAvailableTimeModel>>>
  getProductAvailableTimes(ProductParams params) async {
    try {
      var response = await datasource.getProductAvailableTimes(params);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  // get product by time
  @override
  Future<Either<String, List<ProductByTimeModel>>> getProductByTime(
    ProductParams params,
  ) async {
    try {
      var response = await datasource.getProductByTime(params);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  // get all product genders
  @override
  Future<Either<String, ProductGenderModel>> getProductGenders(
    int clubId,
  ) async {
    try {
      var response = await datasource.getProductGenders(clubId);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }

  // get all products
  @override
  Future<Either<String, List<AllProductsModel>>> getAllProducts(
    int clubId,
  ) async {
    try {
      var response = await datasource.getAllProducts(clubId);
      return right(response);
    } on AppException catch (ex) {
      return left(ex.message!);
    }
  }
}
