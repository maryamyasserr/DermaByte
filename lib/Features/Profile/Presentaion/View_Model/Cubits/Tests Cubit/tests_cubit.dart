import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Profile/Data/Models/test_model/test_model.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo.dart';
import 'package:meta/meta.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit(this.historyRepo) : super(TestsInitial());
  HistoryRepo historyRepo;
  List<TestModel> pTests = [];
  String? testId;
  String? _id;
  set setId(String id) {
    _id = id;
  }

  TestModel? get currentTest {
    try {
      return pTests.firstWhere((test) => (test.id == _id));
    } catch (e) {
      return null;
    }
  }

  Future<void> getPatientTests({required String token}) async {
    emit(TestsLoading());
    var tests = await historyRepo.getPatientTests(token: token);
    tests.fold((failure) {
      emit(TestsFailure(errMessage: failure.errMessage));
    }, (patientTests) {
      emit(TestsSuccess(tests: patientTests));
      pTests = patientTests;
    });
  }
}
