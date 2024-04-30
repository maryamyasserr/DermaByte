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

  DateTime? selectedDate;

  String? doctorId;

  set setDoctorId(String id) {
    doctorId = id;
  }

  Future<void> getFreeTimes(
      {required String token, required dynamic body}) async {
    emit(FreeTimesLoading());
    var response = await edoctorRepo.getFreeTime(body: body, token: token);
    response.fold(
        (failure) => {emit(FreeTimesFailure(errMessage: failure.errMessage))},
        (data) {
      freeTimes = data;
      emit(FreeTimesSuccess());
    });
  }

  set setDay(DateTime selectedDay) {
    day = selectedDay;
  }

  set setDate(DateTime? date) {
    selectedDate = date;
  }

  DateTime? compareDates(DateTime date1, DateTime date2) {
    if (date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day) {
      return date1;
    } else {
      return null;
    }
  }

  FreeTimeModel? get currentFreeTime {
    try {
      return freeTimes.firstWhere((element) =>
          compareDates(element.day!, day ?? DateTime.now()) != null);
    } catch (e) {
      return null;
    }
  }
}
