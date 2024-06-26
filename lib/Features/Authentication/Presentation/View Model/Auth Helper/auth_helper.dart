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
    if (role == 'l') {
      if (labLicense == null || labLicense!.isEmpty) {
        labLicense = pickedFile;
        emit(AuthHelperSuccess());
      } else {
        for (var e in pickedFile) {
          bool exists =
              labLicense!.any((existingFile) => existingFile.name == e.name);
          if (!exists) {
            labLicense!.add(e);
          }
        }
        emit(AuthHelperSuccess());
      }
    } else {
      if (docotrLicense == null || docotrLicense!.isEmpty) {
        docotrLicense = pickedFile;
        emit(AuthHelperSuccess());
      } else {
        for (var e in pickedFile) {
          bool exists =
              docotrLicense!.any((existingFile) => existingFile.name == e.name);
          if (!exists) {
            docotrLicense!.add(e);
          }
        }
        emit(AuthHelperSuccess());
      }
    }
  }

  void removePhoto() {
    profilePatient = null;
    emit(AuthHelperSuccess());
  }

  void removeLicense(XFile license, String role) {
    if (role == 'l') {
      labLicense!.remove(license);
      emit(AuthHelperSuccess());
    } else {
      docotrLicense!.remove(license);
      emit(AuthHelperSuccess());
    }
  }

  void removeDoctorLicense(XFile license) {
    docotrLicense!.remove(license);
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
