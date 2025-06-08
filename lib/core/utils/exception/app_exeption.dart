import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppException implements Exception {
  String? message;
  DioException? dioException;
  Response<dynamic>? response;

  AppException({required this.message, this.dioException, this.response}) {
    {
      if (dioException?.type == DioExceptionType.connectionError ||
          dioException?.error is SocketException) {
        message = 'Check Connection';
      }

      if (dioException?.type == DioExceptionType.connectionTimeout ||
          dioException?.type == DioExceptionType.receiveTimeout ||
          dioException?.type == DioExceptionType.sendTimeout) {
        message = 'Timeout';
      }

      if (dioException?.response?.statusCode == 401) {
        message = 'Unauthorized';
      }

      if (dioException?.response?.statusCode == 403) {
        message = 'Forbidden';
      }

      if (dioException?.response?.statusCode == 404) {
        message = 'Not Found';
      }

      if (dioException?.response?.statusCode == 405) {
        message = 'Not Allowed';
      }

      if (dioException?.response?.statusCode == 429) {
        message = 'Too Many Requests';
      }

      if (dioException?.response?.statusCode == 500) {
        message = 'Internal Server Error';
      }

      if (dioException?.response?.statusCode == 502) {
        message = 'Bad Gateway';
      }

      if (dioException?.response?.statusCode == 504) {
        message = 'Gateway Timeout';
      }

      if (dioException?.response?.statusCode == 704) {
        message = 'Token Expired';
      }
    }
  }
}

// handle and translate all App exceptions from API
String appExceptionHandler(BuildContext context, String message) {
  if (message == 'Check Connection') {
    return 'MyStrings.pleaseCheckTheConnection(context)';
  }
  if (message == 'Timeout') {
    return 'MyStrings.problemConnectingToServer(context)';
  }
  if (message == 'Not Found') {
    return 'MyStrings.requestNotFound(context)';
  }
  if (message == 'Unauthorized') {
    return 'MyStrings.yourAccessIsUnauthorized(context)';
  }
  if (message == 'Forbidden') {
    return 'MyStrings.yourAccessIsUnauthorized(context)';
  }
  if (message == 'Not Allowed') {
    return 'MyStrings.requestMethodNotAllowed(context)';
  }
  if (message == 'Too Many Requests') {
    return 'MyStrings.numberOfRequestsExceededTheLimit(context)';
  }
  if (message == 'Token Expired') {
    return 'MyStrings.yourTokenExpired(context)';
  }
  if (message == 'Internal Server Error') {
    return 'MyStrings.thereIsProblemWithServer(context)';
  }
  if (message == 'Bad Gateway') {
    return 'MyStrings.thereIsProblemWithServer(context)';
  }
  if (message == 'Gateway Timeout') {
    return 'MyStrings.thereIsProblemWithServer(context)';
  }
  if (message == 'Error' || message == 'error') {
    return 'MyStrings.thereIsProblemWithServer(context)';
  } else {
    return message;
  }
}
