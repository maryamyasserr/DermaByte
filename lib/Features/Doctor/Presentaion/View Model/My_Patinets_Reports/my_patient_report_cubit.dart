import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:meta/meta.dart';

part 'my_patient_report_state.dart';

class MyPatientReportCubit extends Cubit<MyPatientReportState> {
  MyPatientReportCubit(this.doctortRepo) : super(MyPatientReportInitial());
  DoctorRepo doctortRepo;
  List<ReportModel> myPatientsReport = [];
  String? _id;

  Future<void> getMyPatientsReport({required String token}) async {
    emit(MyPatientReportLoading());

    var response = await doctortRepo.getMyPatientsReports(token: token);

    response.fold(
        (failure) =>
            emit(MyPatientReportFailure(errMessage: failure.errMessage)),
        (reports) {
      emit(MyPatientReportSuccess());
      myPatientsReport = reports;
    });
  }

  set setId(String id) {
    _id = id;
  }

  ReportModel get getPatientReport =>
      myPatientsReport.firstWhere((element) => element.scan!.id == _id);
}
