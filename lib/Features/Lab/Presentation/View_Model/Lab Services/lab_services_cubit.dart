import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/service_model.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:flutter/material.dart';
part 'lab_services_state.dart';

class LabServiceCubit extends Cubit<ServiceState> {
  LabServiceCubit(this.labRepo) : super(ServiceInitial());
  LabRepo labRepo;
  ServiceModel? service;
  bool isLoading = false;
  Future<void> addService(
      {required String token,
      required dynamic body,
      required BuildContext context}) async {
    emit(ServiceLoading());
    isLoading = true;
    var response =
        await labRepo.addService(token: token, body: body, context: context);
    response.fold((failure) {
      emit(ServiceFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (data) {
      emit(ServiceSuccess());
      isLoading = false;
    });
  }

  Future<void> deleteTest({required String token, required String id}) async {
    emit(ServiceLoading());
    var response = await labRepo.deleteTest(token: token, id: id);
    response.fold((failure) {
      emit(ServiceFailure(errMessage: failure.errMessage));
    }, (done) => emit(ServiceSuccess()));
  }

  Future<void> updateTest(
      {required String token,
      required String id,
      required dynamic body}) async {
    emit(ServiceLoading());
    var response = await labRepo.updateTest(token: token, id: id, body: body);
     response.fold((failure) {
      emit(ServiceFailure(errMessage: failure.errMessage));
    }, (done) => emit(ServiceSuccess()));
  }
}
