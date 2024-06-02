import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:meta/meta.dart';

part 'update_doctor_profile_state.dart';

class UpdateDoctorProfileCubit extends Cubit<UpdateDoctorProfileState> {
  UpdateDoctorProfileCubit(this.doctorRepo)
      : super(UpdateDoctorProfileInitial());
  DoctorRepo doctorRepo;

  Future<void> updateDoctorProfile(
      {required String token, required dynamic body}) async {
    emit(UpdateDoctorProfileLoading());
    var response =
        await doctorRepo.updateDoctorProfile(token: token, body: body);
    response.fold(
        (failure) =>
            emit(UpdateDoctorProfileFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateDoctorProfileSuccess()));
  }

  Future<void> changeDoctorPassword(
      {required String token, required dynamic body}) async {
            emit(UpdateDoctorProfileLoading());
    var response =
        await doctorRepo.changeDoctorPassword(token: token, body: body);
    response.fold(
        (failure) =>
            emit(UpdateDoctorProfileFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateDoctorPasswordSuccess()));
  }
}
