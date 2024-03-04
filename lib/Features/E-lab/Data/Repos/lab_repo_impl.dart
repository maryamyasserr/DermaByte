import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/lab_repo.dart';
import 'package:dio/dio.dart';

class LabRepoImpl implements LabRepo {
  ApiService apiService;
  LabRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<LabModel>>> getAllLabs() async {
    try {
      var response = await apiService.get(endPoint: 'labs');
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
}
