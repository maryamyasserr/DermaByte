import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  PatientModel? patientModel;
  DoctorModel? doctorModel;
  LabModel? labModel;

  Future<void> signUp(
      {required dynamic data,
      @required String? token,
      required BuildContext context,
      required String role}) async {
    emit(AuthLoading());
    if (role == 'patient') {
      var response = await authRepo.signUpAsPatient(data: data, token: token,context:context );
      response.fold((failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      }, (patient) {
        patientModel = patient;
        emit(AuthSuccess());
      });
    } else if (role == 'doctor') {
      var response = await authRepo.signUpAsDsoctor(data: data, token: token,context: context);
      response.fold((failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      }, (doctor) {
        doctorModel = doctor;
        emit(AuthSuccess());
      });
    } else {
      var response = await authRepo.signUpAsLap(data: data, token: token,context: context);
      response.fold((failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      }, (lap) {
        labModel = lap;
        emit(AuthSuccess());
      });
    }
  }
}
