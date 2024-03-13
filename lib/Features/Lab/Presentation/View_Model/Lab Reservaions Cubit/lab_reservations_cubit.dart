import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:meta/meta.dart';

part 'lab_reservations_state.dart';

class LabReservationsCubit extends Cubit<LabReservationsState> {
  LabRepo labRequestsRepo;
  LabReservationsCubit(this.labRequestsRepo) : super(LabReservaionsInitial());

  Future<void> getLabRequests({required String token}) async {
    emit(LabReservaionsLoading());
    var response = await labRequestsRepo.getLabRequests(token: token);
    response.fold((failure) {
      emit(LabReservaionsFailure(errMessage: failure.errMessage));
    }, (labRequests) {
      emit(LabReservaionsSuccess(labRequests: labRequests));
    });
  }
}
