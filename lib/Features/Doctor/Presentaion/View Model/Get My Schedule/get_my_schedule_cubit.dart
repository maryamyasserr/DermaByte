import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_free_time_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:meta/meta.dart';

part 'get_my_schedule_state.dart';

class GetMyScheduleCubit extends Cubit<GetMyScheduleState> {
  GetMyScheduleCubit(this.doctorRepo) : super(GetMyScheduleInitial());
  DoctorRepo doctorRepo;
  Future<void> getMySchedule({required String token}) async {
    emit(GetMyScheduleLoading());
    var response = await doctorRepo.getMySchedule(token: token);
    response.fold((failure) => emit(GetMyScheduleFailure()),
        (data) => emit(GetMyScheduleSuccess(data)));
  }

  Future<void> deleteScheduleDay(
      {required String id, required String token}) async {
     await doctorRepo.deleteScheduleDay(token: token, id: id);
  }
}
