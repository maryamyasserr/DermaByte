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

  String? reservationid;

  Future<void> getMyReservations(
      {required String token,
      required String reviwed,
      required String completed}) async {
    emit(MyReservationLoading());
    var response = await doctorRepo.getMyReservation(
        token: token, reviewd: reviwed, completed: completed);
    response.fold(
        (failure) => emit(MyReservationFailure(errMessage: failure.errMessage)),
        (data) {
      emit(MyReservationSuccess(reservation: data));
      allAppoinments = data;
      for (var e in data) {
        if (myDates.any((date) =>
            date.year == e.date!.year &&
            date.month == e.date!.month &&
            date.day == e.date!.day)) {
        } else {
          myDates.add(DateTime(e.date!.year, e.date!.month, e.date!.day));
        }
      }
      print(myDates);
    });
  }

  Future<void> completePatient(
      {required String id,
      required String token,
      required dynamic body}) async {
    var response =
        await doctorRepo.reviewdPatient(id: id, token: token, body: body);
    response.fold((l) => emit(MyReservationFailure(errMessage: l.errMessage)),
        (r) => emit(MyReservationSuccess()));
  }

  Future<void> viewPatient(
      {required String id,
      required String token,
      required dynamic body}) async {
    await doctorRepo.reviewdPatient(id: id, token: token, body: body);
  }

  set setDate(DateTime date) {
    selectedDate = date;
  }

  // List<MyReservaionModel> selectedAppoinments = [];

  getSelectedDate(DateTime date) {
    emit(MyReservationLoading());
    List<MyReservaionModel> selectedAppoinments = [];
    for (var e in allAppoinments) {
      if (date.year == e.date!.year &&
          date.month == e.date!.month &&
          date.day == e.date!.day) {
        selectedAppoinments.add(e);
      } else {}
    }
    emit(MyReservationSuccess(reservation: selectedAppoinments));
  }

  bool compareDates(DateTime date1, DateTime date2) {
    if (date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day &&
        date1.hour == date2.hour &&
        (date1.minute == date2.minute ||
            date1.difference(date2) <= const Duration(minutes: 10))) {
      return true;
    } else {
      return false;
    }
  }
}
