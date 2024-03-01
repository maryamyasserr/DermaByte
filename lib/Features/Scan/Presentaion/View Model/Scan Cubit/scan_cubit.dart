import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo.dart';
import 'package:dermabyte/Features/Scan/Data/scan.dart';
import 'package:meta/meta.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit(this.scanRepo) : super(ScanInitial());
  ScanRepo scanRepo;

  Future<void> getPatientScan({required String id}) async {
    emit(ScanLoading());
    var response = await scanRepo.getPatientScan(id: id);
    response.fold(
        (failure) => emit(ScanFailure(errMessage: failure.errMessage)),
        (scans) => emit(ScanSuccess(scans: scans)));
  }
}
