import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  Failures({required this.errMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection Timeout with Apiservice');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Your Request was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Connection Error');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'UnExpected Error Please Try Again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      print(response);
      String allMessages = '';
      for (var err in response['message']) {
        allMessages = '${allMessages + err},';
      }
      return ServerFailure(errMessage: allMessages);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      print(response);

      String allMessages = '';
      for (var err in response['message']) {
        allMessages = '${allMessages + err},';
      }
      return ServerFailure(errMessage: allMessages);
    } else {
      print(response);
      return ServerFailure(errMessage: 'There was an Error, Please try again');
    }
  }
}
