import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_reservaion_model/my_reservaion_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:meta/meta.dart';

part 'my_reservation_state.dart';

class MyReservationCubit extends Cubit<MyReservationState> {
  MyReservationCubit(this.doctorRepo) : super(MyReservationInitial());
  DoctorRepo doctorRepo;

  Future<void> getMyReservations({required String token,required String reviwed}) async {
    emit(MyReservationLoading());
    var response = await doctorRepo.getMyReservation(token: token,reviewd: reviwed);
    response.fold(
        (failure) => emit(MyReservationFailure(errMessage: failure.errMessage)),
        (data) => emit(MyReservationSuccess(reservations: data)));
  }
}
