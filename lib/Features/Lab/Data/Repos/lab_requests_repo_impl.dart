import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_request/lab_request.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_requests_repo.dart';
import 'package:dio/dio.dart';

class LabRequestsRepoImpl implements LabRequestsRepo {
  ApiService apiService;
  LabRequestsRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<LabRequest>>> getLabRequests(
      {required id}) async {
    try {
      var response = await apiService.get(
          endPoint: 'labs/$id/laboratory-reservation', token: '');
      List<LabRequest> labs = [];
      for (var lab in response['data']) {
        labs.add(LabRequest.fromJson(lab));
      }
      return right(labs);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
