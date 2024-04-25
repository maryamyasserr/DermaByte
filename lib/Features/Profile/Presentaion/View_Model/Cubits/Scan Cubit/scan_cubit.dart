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

  ScanModel? get currentScan {
    try {
      return patientScans.firstWhere((scan) => (scan.id == _id));
    } catch (e) {
      return null;
    }
  }

  Future<void> getPatientScan({required String token}) async {
    emit(ScanLoading());
    var response = await scanRepo.getPatientScans(token: token);
    response
        .fold((failure) => emit(ScanFailure(errMessage: failure.errMessage)),
            (scans) {
      emit(ScanSuccess(scans: scans));
      patientScans = scans;
    });
  }
}
