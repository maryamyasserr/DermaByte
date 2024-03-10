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
  PreservationModel get currentReservation =>
      reservations.firstWhere((reservation) => reservation.id == _id);

  List<PreservationModel> reservations = [];

  set setId(String id) {
    _id = id;
  }

  Future<void> getPatientReservationInfo({required String token}) async {
    emit(PreservationInfoLoading());
    var result = await preservationInfoRepo.getPatientReservation(token: token);
    result.fold((failure) {
      emit(PreservationInfoFailure(errMessage: failure.errMessage));
    }, (preservationinfo) {
      reservations = preservationinfo;
      emit(PreservationInfoSuccess(pReservationInfo: preservationinfo));
    });
  }
}
