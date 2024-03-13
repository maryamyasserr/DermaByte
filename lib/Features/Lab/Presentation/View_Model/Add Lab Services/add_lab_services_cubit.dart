import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/service_model.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:flutter/material.dart';

part 'add_lab_services_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit(this.labRepo) : super(AddServiceInitial());
  LabRepo labRepo;
  ServiceModel? service;
  bool isLoading = false;
  Future<void> addService(
      {required String token,
      required dynamic body,
      required BuildContext context}) async {
    emit(AddServiceLoading());
    isLoading = true;
    var response =
        await labRepo.addService(token: token, body: body, context: context);
    response.fold((failure) {
      emit(AddServiceFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (data) {
      emit(AddServiceSuccess());
      isLoading = false;
    });
  }
}
