import 'package:bloc/bloc.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

part 'create_scan_state.dart';

class CreateScanCubit extends Cubit<CreateScanState> {
  CreateScanCubit(this.scanRepo) : super(CreateScanInitial());

  ScanRepo scanRepo;
  String? takePhotoPath;
  Future<void> createScan(
      {required dynamic data, required String token}) async {
    emit(CreateScanLoading());
    var response = await scanRepo.createScan(data: data, token: token);
    response.fold(
        (failuer) => emit(CreateScanFailuer(errMessage: failuer.errMessage)),
        (success) => emit(CreateScanSuccess(successMessage: success)));
  }

  Future<void> takePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      takePhotoPath = pickedFile.path;
      GoRouter.of(context).push(AppRoutes.kScanProgress);
    }
  }

  Future<void> uploadPicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      takePhotoPath = pickedFile.path;
      GoRouter.of(context).push(AppRoutes.kScanProgress);
    }
  }
}
