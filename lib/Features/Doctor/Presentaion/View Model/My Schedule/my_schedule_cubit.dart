import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/doctor_schedule_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:meta/meta.dart';

part 'my_schedule_state.dart';

class MyScheduleCubit extends Cubit<MyScheduleState> {
  MyScheduleCubit(this.doctorRepo) : super(MyScheduleInitial());
  DoctorRepo doctorRepo;
  List<DoctorScheduleModel> schedule = [];

  Future<void> getMySchedulesD({required String token}) async {
    emit(MyScheduleLoading());
    var response = await doctorRepo.getMySchedule(token: token);
    response.fold((failure) => emit(MyScheduleFailure()), (data) {
      schedule = data;
      emit(MyScheduleSuccess(
         data
      ));
    });
  }

  Future<void> deleteScheduleDay(
      {required String id, required String token}) async {
    emit(MyScheduleLoading());
    await doctorRepo.deleteScheduleDay(token: token, id: id);
  }
}
