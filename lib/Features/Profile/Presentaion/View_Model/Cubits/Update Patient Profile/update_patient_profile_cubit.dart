import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/Profle%20Repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'update_patient_profile_state.dart';

class UpdatePatientProfileCubit extends Cubit<UpdatePatientProfileState> {
  UpdatePatientProfileCubit(this.profileRepo)
      : super(UpdatePatientProfileInitial());
  ProfileRepo profileRepo;

  Future<void> updatePatientProfile(
      {required String token, required dynamic body}) async {
    emit(UpdatePatientProfileLoading());
    var response =
        await profileRepo.updatePatientProfile(token: token, body: body);
    response.fold(
        (failure) =>
            emit(UpdatePatientProfileFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdatePatientProfileSuccess()));
  }

    Future<void> changePatientPassword(
      {required String token, required dynamic body}) async {
            emit(UpdatePatientProfileLoading());
    var response =
        await profileRepo.changePatientPassword(token: token, body: body);
    response.fold(
        (failure) =>
            emit(UpdatePatientProfileFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdatePatientPasswordSuccess()));
  }
}
