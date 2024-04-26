import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'doctor_reservation_state.dart';

class DoctorReservationCubit extends Cubit<DoctorReservationState> {
  DoctorReservationCubit(this.edoctorRepo) : super(DoctorReservationInitial());
  EdoctorRepo edoctorRepo;

  bool isLoading = false;

  String? scanId, doctorId;

  Future<void> createReservationAndPatientReport(
      {required FormData reservationData,
      required dynamic reportData,
      required BuildContext context,
      required String token}) async {
    emit(DoctorReservationLoading());
    isLoading = true;
    var reservation = await edoctorRepo.createReservaionAndPatientReport(
        context: context,
        reportData: reportData,
        reservationData: reservationData,
        token: token);
    reservation.fold((failure) {
      emit(DoctorReservationFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (data) {
      emit(DoctorReservationSuccess(successMessage: "Done"));
      isLoading = false;
    });
  }
}
