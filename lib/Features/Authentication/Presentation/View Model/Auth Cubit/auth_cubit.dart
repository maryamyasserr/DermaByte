import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/user_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;

  PatientTokenModel? patient;
  DoctorToken? doctorModel;
  LabModel? labModel;

  UserModel? userModel;

  bool isLoding = false;

  Future<void> signUp(
      {required dynamic data,
      @required String? token,
      required BuildContext context,
      required String role}) async {
    emit(AuthLoading());
    if (role == 'patient') {
      var response = await authRepo.signUpAsPatient(
          data: data, token: token, context: context);
      response.fold((failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      }, (patientData) {
        patient = patientData;
        emit(AuthSuccess());
      });
    } else if (role == 'doctor') {
      var response = await authRepo.signUpAsDsoctor(
          data: data, token: token, context: context);
      response.fold((failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      }, (doctor) {
        doctorModel = doctor;
        emit(AuthSuccess());
      });
    } else {
      var response = await authRepo.signUpAsLap(
          data: data, token: token, context: context);
      response.fold((failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
      }, (lap) {
        labModel = lap;
        emit(AuthSuccess());
      });
    }
  }

  // Future<void> signIn(
  //     {required dynamic body, required BuildContext context}) async {
  //   emit(AuthLoading());
  //   isLoding = true;
  //   var response = await authRepo.signInAsPatient(body: body, context: context);
  //   response.fold((failure) {
  //     emit(AuthFailure(errMessage: failure.errMessage));
  //     isLoding = false;
  //   }, (patientData) {
  //     emit(AuthSuccess());
  //     patient = patientData;
  //     isLoding = false;
  //   });
  // }

  Future<void> signIn<T>({
    required dynamic body,
    required BuildContext context,
    String? navigateTo,
  }) async {
    emit(AuthLoading());
    isLoding = true;

    var response = await authRepo.signIn(
      body: body,
      context: context,
    );

    response.fold((failure) {
      emit(AuthFailure(errMessage: failure.errMessage));
      isLoding = false;
    }, (tokenData) {
      if (tokenData is PatientTokenModel) {
        emit(AuthSuccess());
        patient = tokenData;
        isLoding = false;
      } else if (tokenData is DoctorToken) {
        emit(AuthSuccess());
        doctorModel = tokenData;
      } else {
        emit(AuthFailure(errMessage: "Unknown user type"));
        isLoding = false;
      }
    });
  }
}
