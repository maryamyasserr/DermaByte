import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo.dart';
import 'package:meta/meta.dart';

part 'lab_reservaion_state.dart';

class LabReservaionCubit extends Cubit<LabReservaionState> {
  LabReservaionCubit(this.labRepo) : super(LabReservaionInitial());
  ElabRepo labRepo;
  bool isLoading = false;
  // LabReservationModel? labReservationData;
  String? url;
  Future<void> createReservation(
      {required dynamic body, required String token}) async {
    emit(LabReservaionLoading());
    isLoading = true;
    var reservation = await labRepo.createReservation(body: body, token: token);
    reservation.fold((failure) {
      emit(LabReservaionFailuer(errMessage: failure.errMessage));
      isLoading = false;
    }, (paymentUrl) {
      emit(LabReservaionSuccess(successMessage: "Done"));
      url = paymentUrl;
      // labReservationData = labReservation;
      isLoading = false;
    });
  }
}
