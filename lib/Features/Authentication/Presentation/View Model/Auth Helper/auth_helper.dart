import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_helper_state.dart';

class AuthHelperCubit extends Cubit<AuthHeplerState> {
  AuthHelperCubit() : super(AuthHelperInitial());
  bool password = false;
  bool rePassword = false;
  XFile? profilePatient;
  XFile? profileDoctor;
  XFile? profileLab;
  List<XFile>? docotrLicense;
  List<XFile>? labLicense;

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
    final List<XFile> pickedFile = await ImagePicker().pickMultiImage();
    if (role == 'd') {
      docotrLicense = pickedFile;
      emit(AuthHelperSuccess());
    } else {
      labLicense = pickedFile;
      emit(AuthHelperSuccess());
    }
  }

  void removePhoto() {
    profilePatient = null;
    emit(AuthHelperSuccess());
  }

  void passwordVisability() {
    password = !password;
    emit(AuthHelperSuccess());
  }

  void rePasswordVisability() {
    rePassword = !rePassword;
    emit(AuthHelperSuccess());
  }
}
