import 'dart:io';

import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({required this.message, this.statusCode});

  @override
  String toString() => message;

  factory AppException.fromDioError(dynamic error) {
    if (error is AppException) return error;

    try {
      final dioError =
          error as dynamic; // Cast to dynamic to be safe across versions

      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return FetchException(
            message: "Connection Timeout. Please try again.",
          );

        case DioExceptionType.badResponse:
          final statusCode = dioError.response?.statusCode;
          final statusMessage = dioError.response?.statusMessage;
          return _handleStatusCode(statusCode, statusMessage);

        case DioExceptionType.cancel:
          return FetchException(message: "Request to API server was cancelled");
        case DioExceptionType.unknown:
          // Check for internet connection
          if (dioError.error is SocketException) {
            return FetchException(message: "No Internet Connection");
          }
          return FetchException(
            message: "Unexpected Error: ${dioError.toString()}",
          );

        default:
          return FetchException(message: "Something went wrong");
      }
    } catch (e) {
      return FetchException(message: "Unknown Error Occurred");
    }
  }

  static AppException _handleStatusCode(int? statusCode, String? message) {
    switch (statusCode) {
      case 400:
        return BadRequestException(message: message ?? "Bad Request");
      case 401:
        return UnauthorizedException(message: message ?? "Unauthorized");
      case 403:
        return UnauthorizedException(message: message ?? "Forbidden");
      case 404:
        return NotFoundException(message: message ?? "Not Found");
      case 500:
        return InternalServerException(
          message: message ?? "Internal Server Error",
        );
      default:
        return FetchException(
          message: message ?? "Error occurred with code: $statusCode",
        );
    }
  }
}

// Specific Exception Types
class BadRequestException extends AppException {
  BadRequestException({required super.message});
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required super.message});
}

class NotFoundException extends AppException {
  NotFoundException({required super.message});
}

class InternalServerException extends AppException {
  InternalServerException({required super.message});
}

class FetchException extends AppException {
  FetchException({required super.message});
}
