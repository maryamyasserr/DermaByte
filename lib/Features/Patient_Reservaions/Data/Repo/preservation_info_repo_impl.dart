import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:dio/dio.dart';

class PreservationInfoRepoImpl implements PreservationInfoRepo {
  PreservationInfoRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, List<PreservationModel>>> getPatientReservation(
      {required id,required String token}) async {
    try {
      var response =
          await apiService.get(endPoint: 'patients/$id/Patient-reservation',token: token);
      List<PreservationModel> preservation = [];
      for (var item in response['data']) {
        preservation.add(PreservationModel.fromJson(item));
      }
      return right(preservation);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
