import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_helper_state.dart';

class AuthHelperCubit extends Cubit<AuthHeplerState> {
  AuthHelperCubit() : super(AuthHelperInitial());
  bool password = false;
  bool rePassword = false;
  File? photo;
  XFile? profilePic;
  XFile? license;

  Future<void> uploadPicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePic = pickedFile;
      emit(AuthHelperSuccess());
    }
  }

    Future<void> uploadLicense() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      license = pickedFile;
      emit(AuthHelperSuccess());
    }
  }

  void convertoFile() {
    photo = File(profilePic?.path ?? "");
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
