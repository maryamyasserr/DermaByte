import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';

import 'package:meta/meta.dart';

part 'set_schedule_state.dart';

class SetScheduleCubit extends Cubit<SetScheduleState> {
  SetScheduleCubit(this.doctortRepo) : super(SetScheduleInitial());
  DoctorRepo doctortRepo;
  bool isLoading = false;
  Future<void> setSchedule(
      {required Map<String, dynamic> body, required String token}) async {
    emit(SetScheduleLoading());
    isLoading = true;
    var respone = await doctortRepo.setSchedule(body: body, token: token);
    respone.fold((failure) {
      emit(SetScheduleFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (done) {
      emit(SetScheduleSuccess(successMessage: done));
      isLoading = false;
    });
  }
}
