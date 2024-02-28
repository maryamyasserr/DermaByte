import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Appoinments/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Appoinments/Data/Repo/preservation_info_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'preservation_info_state.dart';

class PreservationInfoCubit extends Cubit<PreservationInfoState> {
  PreservationInfoCubit(this.preservationInfoRepo)
      : super(PreservationInfoInitial());
  PreservationInfoRepo preservationInfoRepo;

  Future<void> getPatientReservationInfo({required dynamic id}) async {
    emit(PreservationInfoLoading());
    var result = await preservationInfoRepo.getPatientReservation(id: id);
    result.fold((failure) {
      emit(PreservationInfoFailure(errMessage: failure.errMessage));
    }, (preservationinfo) {
      emit(PreservationInfoSuccess(pReservationInfo: preservationinfo));
    });
  }
}
