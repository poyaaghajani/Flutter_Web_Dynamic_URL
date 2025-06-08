import 'dart:async';
import 'dart:developer';

import 'package:aloplay_simulation/core/cubit/locale_cubit.dart';
import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final StorageManager storage;

  TokenInterceptor(this.storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Fetch token dynamically from storage
      // final tokenData = await storage.getToken();
      // if (tokenData.token != null) {
      //   options.headers['Authorization'] = 'Bearer ${tokenData.token}';
      // }

      // Fetch language code dynamically from LocaleCubit
      final languageCode = locator<LocaleCubit>().state.languageCode;

      options.headers['Accept-Language'] = languageCode;
    } catch (e) {
      log('Error adding headers: $e');
    }

    // Continue with the request
    super.onRequest(options, handler);
  }
}
