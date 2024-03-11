import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:meta/meta.dart';

part 'request_tests_state.dart';

class RequestTestsCubit extends Cubit<RequestTestsState> {
  RequestTestsCubit(this.doctorRepo) : super(RequestTestsInitial());
  DoctorRepo doctorRepo;

  ReportModel? report;

  Future<void> requestTests(
      {required String id, token, required dynamic body}) async {
    emit(RequestTestsLoading());
    var response =
        await doctorRepo.requestTests(id: id, body: body, token: token);
    response.fold((failure) {
      emit(RequestTestsFailure(errMessage: failure.errMessage));
    }, (reportData) {
      emit(RequestTestsSuccess());
      report = reportData;
    });
  }
}
