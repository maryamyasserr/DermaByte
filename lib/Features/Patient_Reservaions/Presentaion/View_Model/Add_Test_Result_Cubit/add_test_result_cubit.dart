import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:meta/meta.dart';

part 'add_test_result_state.dart';

class AddTestResultCubit extends Cubit<AddTestResultState> {
  AddTestResultCubit(this.preservationInfoRepo) : super(AddTestResultInitial());
  PreservationInfoRepo preservationInfoRepo;

  bool isLoading = false;

  Future<void> addTestResult(
      {required String id, token, required dynamic body}) async {
    emit(AddTestResultLoading());
    isLoading = true;
    var response = await preservationInfoRepo.addTestResult(
        id: id, body: body, token: token);
    response.fold((failure) {
      emit(AddTestResultFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (data) {
      emit(AddTestResultSuccess());
      isLoading = false;
    });
  }
}
