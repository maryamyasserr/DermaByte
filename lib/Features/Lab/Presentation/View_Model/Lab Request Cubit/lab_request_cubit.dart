import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_request/lab_request.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_requests_repo.dart';
import 'package:meta/meta.dart';

part 'lab_request_state.dart';

class LabRequestCubit extends Cubit<LabRequestState> {
  LabRequestsRepo labRequestsRepo;
  LabRequestCubit(this.labRequestsRepo) : super(LabRequestInitial());

  Future<void> getLabRequests({required String token}) async {
    emit(LabRequestLoading());
    var response = await labRequestsRepo.getLabRequests(token: token);
    response.fold((failure) {
      emit(LabRequestFailure(errMessage: failure.errMessage));
    }, (labRequests) {
      emit(LabRequestSuccess(labRequests: labRequests));
    });
  }
}
