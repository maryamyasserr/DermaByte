import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/lab_reseervation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/reservation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'preservation_info_state.dart';

class PreservationInfoCubit extends Cubit<PreservationInfoState> {
  PreservationInfoCubit(this.preservationInfoRepo)
      : super(PreservationInfoInitial());
  PreservationInfoRepo preservationInfoRepo;
  String? _id;
  List<PreservationModel> doctorReservations = [];

  Future<void> getPatientReservationInfo({required String token}) async {
    emit(PreservationInfoLoading());
    var result =
        await preservationInfoRepo.getPatientDoctorReservation(token: token);
    result.fold((failure) {
      emit(PreservationInfoFailure(errMessage: failure.errMessage));
    }, (preservationinfo) async {
      doctorReservations = preservationinfo;
      for (int i = 0; i < doctorReservations.length; i++) {
        if (doctorReservations[i].date.isBefore(DateTime.now()) == true) {
          doctorReservations.remove(doctorReservations[i]);
        }
      }
      var response =
        await preservationInfoRepo.getPatientLabReservation(token: token);
    response.fold(
        (failure) =>
            emit(PreservationInfoFailure(errMessage: failure.errMessage)),
        (data) {
      labReservations = data;
      
    });
      emit(PreservationInfoSuccess(allReservationModel: AllReservationModel(labReservations: labReservations, doctorReservations: doctorReservations)));
    });
  }

  Future<void> updatePatinetReservation(
      {required String token,
      required String id,
      required dynamic body}) async {
    emit(UpdateSLoading());
    var response = await preservationInfoRepo.updateSessionDate(
        token: token, id: id, body: body);
    response.fold(
        (fail) => emit(PreservationInfoFailure(errMessage: fail.errMessage)),
        (done) => emit(PreservationInfoSuccess(allReservationModel: AllReservationModel(labReservations: [], doctorReservations: []))));
  }

  set setId(String id) {
    _id = id;
  }

  PreservationModel? get currentReservation {
    try {
      return doctorReservations
          .firstWhere((reservation) => reservation.id == _id);
    } catch (e) {
      return null;
    }
  }

  bool compareDates(DateTime date1, DateTime date2) {
    if (date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day &&
        date1.hour == date2.hour &&
        (date1.minute == date2.minute ||
            date1.difference(date2) <= const Duration(minutes: 10))) {
      return true;
    } else {
      return false;
    }
  }

  List<PLabReservationModel> labReservations = [];

  Future<void> getPatientLabReservations({required String token}) async {
    emit(PreservationInfoLoading());
    var response =
        await preservationInfoRepo.getPatientLabReservation(token: token);
    response.fold(
        (failure) =>
            emit(PreservationInfoFailure(errMessage: failure.errMessage)),
        (data) {
      labReservations = data;
      
    });
  }

  Future<void> deleteReservation(
      {required String id, required String token}) async {
    emit(PreservationInfoLoading());
    var response = await preservationInfoRepo.deleteDoctorReservation(
        token: token, id: id);
    response.fold(
        (failure) =>
            emit(PreservationInfoFailure(errMessage: failure.errMessage)),
        (success) async {
      await getPatientReservationInfo(token: token);
    });
  }

  Future<void> deleteLabReservation(
      {required String token, required String id}) async {
    emit(PreservationInfoLoading());
    await preservationInfoRepo.deletePLabReservation(token: token, id: id);
    await getPatientReservationInfo(token: token);
  }
}
