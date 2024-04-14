import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Models/free_time_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo.dart';
import 'package:meta/meta.dart';

part 'free_times_state.dart';

class FreeTimesCubit extends Cubit<FreeTimesState> {
  FreeTimesCubit(this.edoctorRepo) : super(FreeTimesInitial());
  EdoctorRepo edoctorRepo;
  List<FreeTimeModel> freeTimes = [];
  DateTime? day;

  Future<void> getFreeTimes(
      {required String token, required dynamic body}) async {
    emit(FreeTimesLoading());
    var response = await edoctorRepo.getFreeTime(body: body, token: token);
    response.fold(
        (failure) => {emit(FreeTimesFailure(errMessage: failure.errMessage))},
        (data) => {freeTimes = data});
  }

  set setDay(DateTime selectedDay) {
    day = selectedDay;
  }

  FreeTimeModel get currentFreeTime =>
      freeTimes.firstWhere((element) => element.day == day);
}
