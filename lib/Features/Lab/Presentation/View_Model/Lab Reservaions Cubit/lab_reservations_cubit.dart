import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:meta/meta.dart';

part 'lab_reservations_state.dart';

class LabReservationsCubit extends Cubit<LabReservationsState> {
  LabReservationsCubit(this.labRequestsRepo) : super(LabReservaionsInitial());
  LabRepo labRequestsRepo;

  String? _id;
  List<LabReservations> allReservations = [];

  Future<void> getLabRequests({required String token}) async {
    emit(LabReservaionsLoading());
    var response = await labRequestsRepo.getLabRequests(token: token);
    response.fold((failure) {
      emit(LabReservaionsFailure(errMessage: failure.errMessage));
    }, (labRequests) {
      emit(LabReservaionsSuccess(labRequests: labRequests));
      allReservations = labRequests;
    });
  }

  Future<void> deleteRequest({
    required String id,
    required String token,
  }) async {
    labRequestsRepo.deleteLabRequest(token: token, id: id);
  }

  set setId(String id) {
    _id = id;
  }

  LabReservations? get currentReservation {
    try {
      return allReservations.firstWhere((element) => element.id == _id);
    } catch (e) {
      return null;
    }
  }
}
