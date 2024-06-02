import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:meta/meta.dart';

part 'update_lab_profile_state.dart';

class UpdateLabProfileCubit extends Cubit<UpdateLabProfileState> {
  UpdateLabProfileCubit(this.labRepo) : super(UpdateLabProfileInitial());
  LabRepo labRepo;
  Future<void> updateLabProfile(
      {required String token, required dynamic body}) async {
    emit(UpdateLabProfileLoading());
    var response =
        await labRepo.updateLabProfile(token: token, body: body);
    response.fold(
        (failure) =>
            emit(UpdateLabProfileFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateLabProfileSuccess()));
  }

  Future<void> changeLabPassword(
      {required String token, required dynamic body}) async {
    emit(UpdateLabProfileLoading());
    var response =
        await labRepo.changeLabPassword(token: token, body: body);
    response.fold(
        (failure) =>
            emit(UpdateLabProfileFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateLabProfileSuccess()));
  }
}
