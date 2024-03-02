import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Profile/Data/Models/test_model/test_model.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo.dart';
import 'package:meta/meta.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit(this.historyRepo) : super(TestsInitial());
  HistoryRepo historyRepo;

  Future<void> getPatientTests({required String id}) async {
    emit(TestsLoading());
    var tests = await historyRepo.getPatientTests(id: id);
    tests.fold((failure) {
      emit(TestsFailure(errMessage: failure.errMessage));
    }, (patientTests) {
      emit(TestsSuccess(test: patientTests));
    });
  }
}