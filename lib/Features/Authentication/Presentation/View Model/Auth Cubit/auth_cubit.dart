import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/admin_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_token.dart';
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
  LabToken? labModel;
  AdminToken? adminModel;
  UserModel? userModel;
  bool isLoding = false;

  Future<void> signUp(
      {required dynamic data,
      required BuildContext context,
      required String role}) async {
    emit(AuthLoading());
    isLoding = true;
    var response =
        await authRepo.signUp(data: data, context: context, role: role);
    response.fold((failure) {
      print(failure.errMessage);
      emit(AuthFailure(errMessage: failure.errMessage));
      isLoding = false;
    }, (data) {
      if (data is PatientTokenModel) {
        emit(AuthSuccess());
        isLoding = false;
        patient = data;
      } else if (data is DoctorToken) {
        emit(AuthSuccess());
        doctorModel = data;
        isLoding = false;
      } else if (data is LabToken) {
        emit(AuthSuccess());
        labModel = data;
        isLoding = false;
      } else {
        emit(AuthFailure(errMessage: 'Uexpected role'));
        isLoding = false;
      }
    });
  }

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
    }, (data) {
      if (data is PatientTokenModel) {
        emit(AuthSuccess());
        patient = data;
        isLoding = false;
      } else if (data is DoctorToken) {
        emit(AuthSuccess());
        doctorModel = data;
        isLoding = false;
      } else if (data is LabToken) {
        emit(AuthSuccess());
        labModel = data;
        isLoding = false;
      } else if (data is AdminToken) {
        emit(AuthSuccess());
        adminModel = data;
        isLoding = false;
      } else {
        emit(AuthFailure(errMessage: "Unknown user type"));
        isLoding = false;
      }
    });
  }

  Future<void> logOut({required String token}) async {
    await authRepo.logOut(token: token);
  }
}
