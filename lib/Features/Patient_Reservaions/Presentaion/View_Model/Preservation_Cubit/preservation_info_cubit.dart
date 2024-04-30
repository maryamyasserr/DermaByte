import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'preservation_info_state.dart';

class PreservationInfoCubit extends Cubit<PreservationInfoState> {
  PreservationInfoCubit(this.preservationInfoRepo)
      : super(PreservationInfoInitial());
  PreservationInfoRepo preservationInfoRepo;
  String? _id;
  List<PreservationModel> reservations = [];

  Future<void> getPatientReservationInfo({required String token}) async {
    emit(PreservationInfoLoading());
    var result = await preservationInfoRepo.getPatientReservation(token: token);
    result.fold((failure) {
      emit(PreservationInfoFailure(errMessage: failure.errMessage));
    }, (preservationinfo) {
      reservations = preservationinfo;
      for (int i = 0; i < reservations.length; i++) {
        if (reservations[i].date.isBefore(DateTime.now()) == true) {
          reservations.remove(reservations[i]);
        } 
      }
      emit(PreservationInfoSuccess(pReservationInfo: reservations));
    });
  }

  set setId(String id) {
    _id = id;
  }

  PreservationModel? get currentReservation {
    try {
      return reservations.firstWhere((reservation) => reservation.id == _id);
    } catch (e) {
      return null;
    }
  }

  bool compareDates(DateTime date1, DateTime date2) {
    if (date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day &&
        date1.hour == date2.hour &&
        (date1.minute == date2.minute||
        date1.difference(date2)<=const Duration(minutes: 10))) {
      return true;
    } else {
      return false;
    }
  }
}
