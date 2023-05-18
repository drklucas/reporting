import 'package:flutter/material.dart';

abstract class RequestDispatcher {
  Future<Map> get(
    String url, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  });

  Future<Map> show(
    String url,
    int id, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  });

  Future<Map> post(
    String url, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  });

  Future<Map> put(
    String url,
    int id, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  });

  Future<Map> delete(
    String url,
    int id, {
    required BuildContext context,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  });
}
