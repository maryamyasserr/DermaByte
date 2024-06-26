import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model/lab_model.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo.dart';
import 'package:dio/dio.dart';

class ElabRepoImpl implements ElabRepo {
  ApiService apiService;
  ElabRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<LabModel>>> getAllLabs(
      {required String token}) async {
    try {
      var response = await apiService.get(endPoint: 'labs', token: token);
      List<LabModel> labs = [];
      for (var lab in response['data']) {
        labs.add(LabModel.fromJson(lab));
      }
      // debugPrint('$labs');
      return right(labs);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> createReservation(
      {required body, required String token}) async {
    try {
      var reservation = await apiService.getWithBody(
          endPoint: 'bookings/checkout-session/lab', body: body, token: token);
      print(reservation);
      String url = reservation['session']['url'];
      print(url);
      return right(url);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
