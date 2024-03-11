import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'request_tests_state.dart';

class RequestTestsCubit extends Cubit<RequestTestsState> {
  RequestTestsCubit(this.doctorRepo) : super(RequestTestsInitial());
  DoctorRepo doctorRepo;
  ReportModel? report;

  bool isLoading = false;

  Future<void> requestTests(
      {required String id,
      token,
      required dynamic body,
      required BuildContext context}) async {
    emit(RequestTestsLoading());
    isLoading = true;
    var response = await doctorRepo.requestTests(
        id: id, body: body, token: token, context: context);
    response.fold((failure) {
      emit(RequestTestsFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (reportData) {
      emit(RequestTestsSuccess());
      report = reportData;
      isLoading = false;
    });
  }
}
