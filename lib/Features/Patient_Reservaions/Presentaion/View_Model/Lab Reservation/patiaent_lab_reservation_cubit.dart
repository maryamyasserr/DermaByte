import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/lab_reseervation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:meta/meta.dart';

part 'patiaent_lab_reservation_state.dart';

class PatientLabReservationCubit extends Cubit<PatientLabReservationState> {
  PatientLabReservationCubit(this.patietnRepo)
      : super(PatiaentLabReservationInitial());
  PreservationInfoRepo patietnRepo;

  List<PLabReservationModel> labReservations = [];

  Future<void> getPatientLabReservations({required String token}) async {
    var response = await patietnRepo.getPatientLabReservation(token: token);
    response.fold(
        (failure) =>
            emit(PatiaentLabReservationFailure(errMessage: failure.errMessage)),
        (data) {
      labReservations = data;
      emit(PatiaentLabReservationSuccess(reservations: data));
    });
  }

  Future<void> deleteLabReservation(
      {required String token, required String id}) async {
    emit(PatiaentLabReservationLoading());
    await patietnRepo.deletePLabReservation(token: token, id: id);
    getPatientLabReservations(token: token);
  }
}
