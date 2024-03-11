import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  ApiService(this._dio);
  final _baseUlr = 'https://dermabyte-apis.onrender.com/api/v1/';
  final Dio _dio;

  Future<Map<String, dynamic>> get(
      {required String endPoint, required String token}) async {
    _dio.options.connectTimeout = const Duration(milliseconds: 15000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 15000);
    _dio.options.headers = {"Authorization": "Bearer $token"};
    Response response = await _dio.get('$_baseUlr$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      required Map data,
      @required String? token}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = "Bearer $token";
      _dio.options.headers['Content-Type'] = "application/json";
    } else {
      _dio.options.headers.remove('Authorization');
    }

    var response = await _dio.post(
      '$_baseUlr$endPoint',
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postWithMultiForm(
      {required String endPoint,
      required FormData data,
      @required String? token}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = "Bearer $token";
    } else {
      _dio.options.headers.remove('Authorization');
    }
    var response = await _dio.post('$_baseUlr$endPoint',
        data: data,
        options: Options(contentType: Headers.multipartFormDataContentType));
    return response.data;
  }

  Future<Map<String, dynamic>> postttt(
      {required String endPoint,
      required Map data,
      @required String? token}) async {
    _dio.options.headers = {
      'Content-Type':
          'multipart/form-data; boundary=<calculated when request is sent>'
    };
    var response = await _dio.post('$_baseUlr$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> update(
      {required String endPoint,
      required dynamic data,
      required String id,
      @required String? token}) async {
     _dio.options.headers['Content-Type'] = "application/json";
    Response response = await _dio.put('$_baseUlr$endPoint$id', data: data);
    return response.data;
  }

  Future<void> delete({required String endPoint, required int id}) async {
    await _dio.delete('$_baseUlr$endPoint$id');
  }
}
