import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/E-lab/Data/Models/lab_reservation.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo.dart';
import 'package:meta/meta.dart';

part 'lab_reservaion_state.dart';

class LabReservaionCubit extends Cubit<LabReservaionState> {
  LabReservaionCubit(this.labRepo) : super(LabReservaionInitial());
  LabRepo labRepo;
  bool isLoading = false;
  LabReservationModel? labReservationData;
  Future<void> createReservation(
      {required dynamic body, @required String? token}) async {
    emit(LabReservaionLoading());
    isLoading = true;
    var reservation = await labRepo.createReservation(body: body, token: token);
    reservation.fold((failure) {
      emit(LabReservaionFailuer(errMessage: failure.errMessage));
      isLoading = false;
    }, (labReservation) {
      emit(LabReservaionSuccess(successMessage: "Done"));
      labReservationData = labReservation;
      isLoading = false;
    });
  }
}
