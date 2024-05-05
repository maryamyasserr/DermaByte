import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:flutter/material.dart';

part 'update_report_state.dart';

class UpdateReportCubit extends Cubit<UpdateReportState> {
  UpdateReportCubit(this.doctorRepo) : super(UpdatePatientReportInitial());

  DoctorRepo doctorRepo;
  ReportModel? report;

  bool isLoading = false;

  Future<void> updateReport(
      {required String id,
      token,
      required dynamic body,
      required BuildContext context}) async {
    emit(UpdatePatientReportStateLoading());
    isLoading = true;
    var response = await doctorRepo.updatePatientReport(
        id: id, body: body, token: token, context: context);

    response.fold((failure) {
      emit(UpdatePatientReportStateFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (reportData) {
      emit(UpdatePatientReportStateSuccess());
      report = reportData;
      isLoading = false;
    });
  }
}
