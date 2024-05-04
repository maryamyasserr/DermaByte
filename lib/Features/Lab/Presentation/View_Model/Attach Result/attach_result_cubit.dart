import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:flutter/material.dart';
part 'attach_result_state.dart';

class AttachResultCubit extends Cubit<AttachResultState> {
  AttachResultCubit(this.labRepo) : super(AttachResultInitial());
  LabRepo labRepo;

  bool isLoading = false;
  Future<void> attachResult(
      {required String token,
      required dynamic body,
      required BuildContext context}) async {
    emit(AttachResultLoading());
    isLoading = true;
    var response =
        await labRepo.attachResult(body: body, token: token, context: context);
    response.fold((failure) {
      emit(AttachResultFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (data) {
      emit(AttachResultSuccess());
      isLoading = false;
    });
  }
}
