import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo.dart';
import 'package:meta/meta.dart';

part 'create_scan_state.dart';

class CreateScanCubit extends Cubit<CreateScanState> {
  CreateScanCubit(this.scanRepo) : super(CreateScanInitial());

  ScanRepo scanRepo;

  Future<void> createScan(
      {required dynamic data, required String token}) async {
    emit(CreateScanLoading());
    var response = await scanRepo.createScan(data: data, token: token);
    response.fold(
        (failuer) => emit(CreateScanFailuer(errMessage: failuer.errMessage)),
        (success) => emit(CreateScanSuccess(successMessage: success)));
  }
}
