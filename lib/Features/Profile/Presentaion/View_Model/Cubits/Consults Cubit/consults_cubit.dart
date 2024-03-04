import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Profile/Data/Models/patient_consults_model/patient_consults.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo.dart';
import 'package:meta/meta.dart';

part 'consults_state.dart';

class ConsultsCubit extends Cubit<ConsultsState> {
  ConsultsCubit(this.historyRepo) : super(ConsultsInitial());
  HistoryRepo historyRepo;
  List<PatientConsultsModel> patientConsults = [];
  String? _id;
  set setId(String id) {
    _id = id;
  }

  PatientConsultsModel get currentConsultation =>
      patientConsults.firstWhere((consulation) => consulation.id == _id);
  Future<void> getPatientConults({required String id}) async {
    emit(ConsultsLoading());
    var consults = await historyRepo.getPatientConsults(id: id);
    consults.fold((failure) {
      emit(ConsultsFailure(errMessage: failure.errMessage));
    }, (consults) {
      emit(ConsultsSuccess(consults: consults));
      patientConsults = consults;
    });
  }
}
