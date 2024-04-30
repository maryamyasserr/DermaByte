import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:meta/meta.dart';

part 'delete_reservation_state.dart';

class DeleteReservationCubit extends Cubit<DeleteReservationState> {
  DeleteReservationCubit(this.preservationInfoRepo)
      : super(DeleteReservationInitial());
  PreservationInfoRepo preservationInfoRepo;

  Future<void> deleteReservation(
      {required String id, required String token}) async {
    var response =
        await preservationInfoRepo.deleteReservation(token: token, id: id);
    response.fold(
        (failure) =>
            emit(DeleteReservationFailure(errMessage: failure.errMessage)),
        (success) => emit(DeleteReservationSuccess(successMessage: success)));
  }
}
