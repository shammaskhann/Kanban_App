import 'package:dio/dio.dart';
import 'package:kanban_app/network/constants/api_constants.dart';
import 'package:kanban_app/network/constants/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options
      ..baseUrl = ApiEndpoints.baseUrl
      ..connectTimeout = ApiConstants.connectTimeout
      ..receiveTimeout = ApiConstants.receiveTimeout
      ..headers = {'Content-Type': 'application/json; charset=UTF-8'};

    // Interceptors
    _dio.interceptors.add(_interceptorsWrapper());
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  InterceptorsWrapper _interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        //Auth Token

        // final token = LocalStorage.getToken();
        // if (token != null) {
        //   options.headers['Authorization'] = 'Bearer $token';
        // }

        options.headers['Authorization'] = 'Bearer ${ApiConstants.testToken}';

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    );
  }

  // Generic Get Request
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException {
      rethrow; // Rethrow to be caught by Repository layer
    }
  }

  // Generic Post Request
  Future<dynamic> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  // Generic Put Request
  Future<dynamic> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  // Generic Delete Request
  Future<dynamic> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}
