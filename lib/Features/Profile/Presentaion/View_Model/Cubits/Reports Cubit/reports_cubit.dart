import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Profile/Data/Models/patient_consults_model/patient_consults_model.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo.dart';
import 'package:meta/meta.dart';

part 'reports_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit(this.historyRepo) : super(ReportInitial());
  HistoryRepo historyRepo;
  List<ReportModel> patientConsults = [];
  String? _id;
  Future<void> getPatientConults({required String id}) async {
    emit(ReportLoading());
    var consults = await historyRepo.getPatientConsults(id: id);
    consults.fold((failure) {
      emit(ReportFailure(errMessage: failure.errMessage));
    }, (consults) {
      emit(ReportSuccess(reports: consults));
      patientConsults = consults;
    });
  }

  set setId(String id) {
    _id = id;
  }

  ReportModel get patientReport =>
      patientConsults.firstWhere((report) => report.dermatologist!.id == _id);

  ReportModel get currentConsultation =>
      patientConsults.firstWhere((consulation) => consulation.id == _id);
}
