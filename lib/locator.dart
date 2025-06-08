import 'package:aloplay_simulation/core/cubit/business_model_type_cubit.dart';
import 'package:aloplay_simulation/core/cubit/drop_down_cubit.dart';
import 'package:aloplay_simulation/core/cubit/float_action_cubit.dart';
import 'package:aloplay_simulation/core/cubit/locale_cubit.dart';
import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/core/utils/token_interceptor.dart';
import 'package:aloplay_simulation/features/club/data/datasource/club_datasource.dart';
import 'package:aloplay_simulation/features/club/data/repository/club_repository.dart';
import 'package:aloplay_simulation/features/club/presentation/bloc/get_all/get_club_bloc.dart';
import 'package:aloplay_simulation/features/club/presentation/bloc/get_single/get_single_club_bloc.dart';
import 'package:aloplay_simulation/features/club_category/data/datasource/club_category_datasource.dart';
import 'package:aloplay_simulation/features/club_category/data/repository/club_category_repository.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/club_category_manage_bloc.dart';
import 'package:aloplay_simulation/features/coach/data/datasource/coach_datasource.dart';
import 'package:aloplay_simulation/features/coach/data/repository/coach_repository.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/public_coach_manage_bloc.dart';
import 'package:aloplay_simulation/features/product/data/datasource/product_datasource.dart';
import 'package:aloplay_simulation/features/product/data/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

const String _aloPlayInstanceName = 'aloPlayDio';
const String _aloPlayBlogInstanceName = 'aloPlayBlogDio';

Future<void> getInit() async {
  /// Storage Manager
  locator.registerLazySingleton<StorageManager>(() => StorageManagerImpl());

  /// Alo Play Dio instance
  final aloPlayDio = Dio(
    BaseOptions(
      baseUrl: 'https://ws.aloplay.io/api/',
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
      sendTimeout: kIsWeb ? null : const Duration(minutes: 2),
    ),
  );
  aloPlayDio.interceptors.add(TokenInterceptor(locator<StorageManager>()));
  locator.registerSingleton<Dio>(
    aloPlayDio,
    instanceName: _aloPlayInstanceName,
  );

  /// Alo Play Blog Dio instance
  final aloPlayBlogDio = Dio(
    BaseOptions(
      baseUrl: 'https://blogapi.aloplay.io/api/',
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
      sendTimeout: kIsWeb ? null : const Duration(minutes: 2),
    ),
  );
  aloPlayBlogDio.interceptors.add(TokenInterceptor(locator<StorageManager>()));
  locator.registerSingleton<Dio>(
    aloPlayBlogDio,
    instanceName: _aloPlayBlogInstanceName,
  );

  /// Data
  locator.registerSingleton<IClubCategoryDatasource>(
    ClubCategoryRemoteDatasource(
      locator<Dio>(instanceName: _aloPlayInstanceName),
      locator(),
    ),
  );
  locator.registerSingleton<IProductDatasource>(
    ProductRemoteDatasource(
      locator<Dio>(instanceName: _aloPlayInstanceName),
      locator(),
    ),
  );
  locator.registerSingleton<IPublicClubDatasource>(
    PublicClubRemoteDatasource(
      locator<Dio>(instanceName: _aloPlayInstanceName),
      locator(),
    ),
  );
  locator.registerSingleton<IPublicCoachDatasource>(
    PublicCoachRemoteDatasource(
      locator<Dio>(instanceName: _aloPlayInstanceName),
      locator(),
    ),
  );

  /// Repo
  locator.registerSingleton<IClubCategoryRepository>(
    ClubCategoryRepository(locator()),
  );
  locator.registerSingleton<IProductRepository>(ProductRepository(locator()));
  locator.registerSingleton<IPublicClubRepository>(
    PublicClubRepository(locator()),
  );
  locator.registerSingleton<IPublicCoachRepository>(
    PublicCoachRepository(locator()),
  );

  /// Blocs
  locator.registerSingleton<ClubCategoryManageBloc>(
    ClubCategoryManageBloc(locator()),
  );
  locator.registerSingleton<GetPublicClubBloc>(GetPublicClubBloc(locator()));
  locator.registerSingleton<PublicCoachManageBloc>(
    PublicCoachManageBloc(locator(), locator()),
  );
  locator.registerSingleton<GetSinglePublicClubBloc>(
    GetSinglePublicClubBloc(locator()),
  );

  /// Cubits
  locator.registerSingleton<LocaleCubit>(LocaleCubit());
  locator.registerFactory<DropdownCubit>(() => DropdownCubit());
  locator.registerSingleton<FloatingActionButtonCubit>(
    FloatingActionButtonCubit(),
  );
  locator.registerSingleton<BusinessModelTypeCubit>(
    BusinessModelTypeCubit(locator()),
  );
}
