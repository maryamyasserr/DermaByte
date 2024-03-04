import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/scan.dart';
import 'package:meta/meta.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit(this.scanRepo) : super(ScanInitial());
  HistoryRepo scanRepo;
  String? _id;
  List<ScanModel> patientScans = [];
  set setId(String id) {
    _id = id;
  }

  ScanModel get currentScan =>
      patientScans.firstWhere((element) => (element.id == _id));
  Future<void> getPatientScan({required String id}) async {
    emit(ScanLoading());
    var response = await scanRepo.getPatientScans(id: id);
    response
        .fold((failure) => emit(ScanFailure(errMessage: failure.errMessage)),
            (scans) {
      emit(ScanSuccess(scans: scans));
      patientScans = scans;
    });
  }
}
