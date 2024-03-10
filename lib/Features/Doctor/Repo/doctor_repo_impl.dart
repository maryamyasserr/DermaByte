import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_reservaion_model/my_reservaion_model.dart';
import 'package:dermabyte/Features/Doctor/Repo/Doctor_repo.dart';
import 'package:dio/dio.dart';

class DoctorRepoImpl implements DoctorRepo {
  DoctorRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, List<MyReservaionModel>>> getMyReservation(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'dermatologists/Dermatologist-reservation', token: token);
      List<MyReservaionModel> myReservations = [];
      for (var element in response['data']) {
        myReservations.add(MyReservaionModel.fromJson(element));
      }
      return right(myReservations);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
