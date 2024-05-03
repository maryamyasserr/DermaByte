import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo.dart';
import 'package:flutter/material.dart';

part 'doctor_reservation_state.dart';

class DoctorReservationCubit extends Cubit<DoctorReservationState> {
  DoctorReservationCubit(this.edoctorRepo) : super(DoctorReservationInitial());
  EdoctorRepo edoctorRepo;

  bool isLoading = false;

  String? doctorId, url;
  List<String> scanId = [];
  List<int> indices = [];
  List<String> scanName = [];

  List<String> ids = [];
  List<String> scans = [];
  Future<void> createReservationAndPatientReport(
      {required dynamic reservationData,
      required dynamic reportData,
      required BuildContext context,
      required String token}) async {
    emit(DoctorReservationLoading());
    emit(SelectScanSuccess(scans: [scanName, scanId]));
    isLoading = true;
    var reservation = await edoctorRepo.createReservaionAndPatientReport(
        context: context,
        reportData: reportData,
        reservationData: reservationData,
        token: token);
    reservation.fold((failure) {
      emit(DoctorReservationFailure(errMessage: failure.errMessage));
      emit(SelectScanSuccess(scans: [scanName, scanId]));
      isLoading = false;
    }, (paymentUrl) {
      url = paymentUrl;
      emit(DoctorReservationSuccess(successMessage: "Done"));
      isLoading = false;
    });
  }

  void selectScan(List<String> ids, List<String> name) {
    scanId = ids;
    scanName = name;
    if (scanId.isEmpty || scanName.isEmpty) {
      emit(SelectScanFailuar());
    } else {
      emit(SelectScanSuccess(scans: [scanName, scanId]));
    }
  }

  void deleteScan(String name, String id, index) {
    scanName.remove(name);
    scanId.remove(id);
    indices.remove(index);
    if (scanName.isEmpty || scanId.isEmpty) {
      emit(SelectScanFailuar());
    } else {
      emit(SelectScanSuccess(scans: [scanName, scanId]));
    }
  }

  void deleteAllScans() {
    scanId = [];
    scanName = [];
    emit(SelectScanFailuar());
  }
}
