import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_helper_state.dart';

class AuthHelperCubit extends Cubit<AuthHeplerState> {
  AuthHelperCubit() : super(AuthHelperInitial());
  bool password = false;
  bool rePassword = false;
  // File? profilePatient;
  // File? profileLab;
  // File? profileDoctor;
  XFile? profilePatient;
  XFile? profileDoctor;
  XFile? profileLab;
  XFile? labLicense;
  XFile? docotrLicense;

  Future<void> uploadPicture({required String role}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (role == 'p') {
        profilePatient = pickedFile;
        emit(AuthHelperSuccess());
      } else if (role == 'd') {
        profileDoctor = pickedFile;
        emit(AuthHelperSuccess());
      } else {
        profileLab = pickedFile;
        emit(AuthHelperSuccess());
      }
    }
  }

  Future<void> uploadLicense({required String role}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (role == 'd') {
        docotrLicense = pickedFile;
        emit(AuthHelperSuccess());
      } else {
        docotrLicense = pickedFile;
        emit(AuthHelperSuccess());
      }
    }
  }

  // void convertoFile() {
  //   photo = File(profilePic?.path ?? "");
  // }

  void passwordVisability() {
    password = !password;
    emit(AuthHelperSuccess());
  }

  void rePasswordVisability() {
    rePassword = !rePassword;
    emit(AuthHelperSuccess());
  }
}
