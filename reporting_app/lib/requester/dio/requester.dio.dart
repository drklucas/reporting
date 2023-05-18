import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/requester/requester.dart';
import 'package:reporting_app/routes/api/api.routes.dart';

import '../../providers/auth.provider.dart';

class DioRequester extends RequestDispatcher {
  final dio = Dio();

  @override
  Future<Map> delete(
    String url,
    int id, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    Response response;
    try {
      Map<String, dynamic> headers0 = {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer  ${context.read<AuthProvider>().auth.acess_token!}",
      };

      if (headers != null) {
        headers0.addAll(headers);
      }

      response = await dio.delete(
        ApiRoutes.BASE_URL + ApiRoutes.ROUTE_GROUP + url + id.toString(),
        options: Options(
          headers: headers0,
        ),
        queryParameters: queryParameters,
        data: data != null ? jsonEncode(data) : null,
      );

      return {
        'success': true,
        'statusCode': response.statusCode,
        'data': response.data,
        'headers': response.headers,
        'statusMessage': response.statusMessage,
      };
    } on DioError catch (e) {
      //implementar lógica para erros
      print(e);
      return {
        'success': false,
        'statusCode': 500,
        'error': e.error,
        'message': e.message,
        'data': e.response,
        'type': e.type
      };
    }
  }

  @override
  Future<Map> get(
    String url, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    Response response;
    try {
      Map<String, dynamic> headers0 = {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer  ${context.read<AuthProvider>().auth.acess_token!}",
      };

      if (headers != null) {
        headers0.addAll(headers);
      }

      response = await dio.get(
        ApiRoutes.BASE_URL + ApiRoutes.ROUTE_GROUP + url,
        options: Options(
          headers: headers0,
        ),
        queryParameters: queryParameters,
        data: data != null ? jsonEncode(data) : null,
      );

      return {
        'success': true,
        'statusCode': response.statusCode,
        'data': response.data,
        'headers': response.headers,
        'statusMessage': response.statusMessage,
      };
    } on DioError catch (e) {
      //implementar lógica para erros
      print(e);
      return {
        'success': false,
        'statusCode': 500,
        'error': e.error,
        'message': e.message,
        'data': e.response,
        'type': e.type
      };
    }
  }

  @override
  Future<Map> post(
    String url, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) async {
    Response response;
    try {
      Map<String, dynamic> headers0 = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      if (context.read<AuthProvider>().auth != null) {
        headers0.addAll({
          "Authorization":
              "Bearer  ${context.read<AuthProvider>().auth.acess_token!}",
        });
      }

      if (headers != null) {
        headers0.addAll(headers);
      }

      response = await dio.post(
        ApiRoutes.BASE_URL + ApiRoutes.ROUTE_GROUP + url,
        options: Options(
          headers: headers0,
        ),
        queryParameters: queryParameters,
        data: data != null ? jsonEncode(data) : null,
      );

      return {
        'success': true,
        'statusCode': response.statusCode,
        'data': response.data,
        'headers': response.headers,
        'statusMessage': response.statusMessage,
      };
    } on DioError catch (e) {
      //implementar lógica para erros
      print(e);
      return {
        'success': false,
        'statusCode': 500,
        'error': e.error,
        'message': e.message,
        'data': e.response,
        'type': e.type
      };
    }
  }

  @override
  Future<Map> put(
    String url,
    int id, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) async {
    Response response;
    try {
      Map<String, dynamic> headers0 = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "Bearer  ${context.read<AuthProvider>().auth.acess_token!}",
      };

      if (headers != null) {
        headers0.addAll(headers);
      }

      response = await dio.put(
        ApiRoutes.BASE_URL + ApiRoutes.ROUTE_GROUP + url,
        options: Options(
          headers: headers0,
        ),
        queryParameters: queryParameters,
        data: data != null ? jsonEncode(data) : null,
      );

      return {
        'success': true,
        'statusCode': response.statusCode,
        'data': response.data,
        'headers': response.headers,
        'statusMessage': response.statusMessage,
      };
    } on DioError catch (e) {
      //implementar lógica para erros
      print(e);
      return {
        'success': false,
        'statusCode': 500,
        'error': e.error,
        'message': e.message,
        'data': e.response,
        'type': e.type
      };
    }
  }

  @override
  Future<Map> show(String url, int id,
      {required BuildContext context,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      Map<String, dynamic>? data}) async {
    Response response;
    try {
      Map<String, dynamic> headers0 = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "Bearer  ${context.read<AuthProvider>().auth.acess_token!}",
      };

      if (headers != null) {
        headers0.addAll(headers);
      }

      response = await dio.get(
        ApiRoutes.BASE_URL + ApiRoutes.ROUTE_GROUP + url + id.toString(),
        options: Options(
          headers: headers0,
        ),
        queryParameters: queryParameters,
        data: data != null ? jsonEncode(data) : null,
      );

      return {
        'success': true,
        'statusCode': response.statusCode,
        'data': response.data,
        'headers': response.headers,
        'statusMessage': response.statusMessage,
      };
    } on DioError catch (e) {
      //implementar lógica para erros
      print(e);
      return {
        'success': false,
        'statusCode': 500,
        'error': e.error,
        'message': e.message,
        'data': e.response,
        'type': e.type
      };
    }
  }
}
