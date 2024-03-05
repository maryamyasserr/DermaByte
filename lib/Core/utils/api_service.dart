import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  ApiService(this._dio);
  final _baseUlr = 'https://dermabyte-apis.onrender.com/api/v1/';
  final Dio _dio;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    _dio.options.connectTimeout = const Duration(milliseconds: 10000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 10000);
    Response response = await _dio.get('$_baseUlr$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      required Map data,
      @required String? token}) async {
    _dio.options.headers = {'Content-Type': 'application/json'};
    var response = await _dio.post('$_baseUlr$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> update(
      {required String endPoint,
      required dynamic data,
      required int id,
      @required String? token}) async {
    Response response = await _dio.put('$_baseUlr$endPoint$id', data: data);
    return response.data;
  }

  Future<void> delete({required String endPoint, required int id}) async {
    await _dio.delete('$_baseUlr$endPoint$id');
  }
}
