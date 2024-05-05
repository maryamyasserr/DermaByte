import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:meta/meta.dart';

part 'my_patient_report_state.dart';

class MyPatientReportCubit extends Cubit<MyPatientReportState> {
  MyPatientReportCubit(this.doctortRepo) : super(MyPatientReportInitial());
  DoctorRepo doctortRepo;
  List<ReportModel> _myPatientsReport = [];
  String? reportid;

  Future<void> getMyPatientsReport({required String token}) async {
    emit(MyPatientReportLoading());

    var response = await doctortRepo.getMyPatientsReports(token: token);

    response.fold(
        (failure) =>
            emit(MyPatientReportFailure(errMessage: failure.errMessage)),
        (reports) {
      emit(MyPatientReportSuccess());
      _myPatientsReport = reports;
    });
  }

  set setId(String id) {
    reportid = id;
  }

  ReportModel? get getPatientReport {
    try {
      return _myPatientsReport.firstWhere((element) => element.id == reportid);
    } catch (e) {
      return null;
    }
  }
}
