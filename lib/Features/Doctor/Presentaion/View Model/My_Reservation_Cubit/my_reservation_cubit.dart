import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/p_reservation/p_reservation.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:meta/meta.dart';

part 'my_reservation_state.dart';

class MyReservationCubit extends Cubit<MyReservationState> {
  MyReservationCubit(this.doctorRepo) : super(MyReservationInitial());
  DoctorRepo doctorRepo;
  List<MyReservaionModel> allAppoinments = [];
  List<DateTime> myDates = [];
  DateTime? selectedDate;

  Future<void> getMyReservations(
      {required String token, required String reviwed}) async {
    emit(MyReservationLoading());
    var response =
        await doctorRepo.getMyReservation(token: token, reviewd: reviwed);
    response.fold(
        (failure) => emit(MyReservationFailure(errMessage: failure.errMessage)),
        (data) {
      emit(MyReservationSuccess());
      allAppoinments = data;
      print(data);
      for (var e in data) {
        print(e);
        if (myDates.any((date) =>
            date.year == e.date!.year &&
            date.month == e.date!.month &&
            date.day == e.date!.day)) {
          print(e.date);
        } else {
          myDates.add(DateTime(e.date!.year, e.date!.month, e.date!.day));
        }
      }
      print(myDates);
    });
  }

  Future<void> viewPatient(
      {required String id,
      required String token,
      required dynamic body}) async {
    var response =
        await doctorRepo.reviewdPatient(id: id, token: token, body: body);
    response.fold(
        (failure) => emit(MyReservationFailure(errMessage: failure.errMessage)),
        (data) => emit(MyReservationSuccess()));
  }

  set setDate(DateTime date) {
    selectedDate = date;
  }

  getSelectedDate(DateTime date) {
    List<MyReservaionModel> selectedAppoinments = [];
    for (var e in allAppoinments) {
      if (date.year == e.date!.year &&
          date.month == e.date!.month &&
          date.day == e.date!.day) {
        selectedAppoinments.add(e);
      } else {}
    }
    emit(MyAppoinmentsSuccess(appoinments: selectedAppoinments));
  }
}
