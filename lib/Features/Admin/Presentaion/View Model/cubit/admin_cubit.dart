import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Admin/Data/Models/doctor_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Models/lab_dash/lab_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Models/patient_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Repo/admin_repo.dart';
import 'package:meta/meta.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this.adminRepo) : super(AdminInitial());

  AdminRepo adminRepo;

  String role = 'p';

  List<PatientDash> allPatients = [];

  List<DoctorDash> doctorsRequests = [];
  List<DoctorDash> allDoctors = [];

  List<LabDash> labRequests = [];
  List<LabDash> allLabs = [];

  Future<void> getAllPatientsDash({required String token}) async {
    role = 'p';
    emit(AdminLoading());
    var response = await adminRepo.getAllPatientsDash(token: token);
    response
        .fold((failure) => emit(AdminFailure(errMessage: failure.errMessage)),
            (patients) {
      allPatients = patients;
      emit(AdminSuccess());
    });
  }

  Future<void> deletePatinet({
    required String token,
    required String id,
  }) async {
    await adminRepo.deletePatient(token: token, id: id);
  }

  Future<void> getAllDashDoctor({required String token}) async {
    role = 'd';
    emit(AdminLoading());
    var response =
        await adminRepo.getAllDoctorsDash(token: token, state: 'true');
    response.fold(
      (l) {
        emit(AdminFailure(errMessage: l.errMessage));
      },
      (r) {
        allDoctors = r.where((doctor) => doctor.state == true).toList();
        doctorsRequests = r.where((doctor) => doctor.state == false).toList();
        emit(AdminSuccess());
      },
    );
  }

  Future<void> getAllDashLabs({required String token}) async {
    role = 'l';
    emit(AdminLoading());
    var response = await adminRepo.getAllLabsDash(token: token, state: 'true');
    response.fold(
      (l) {
        emit(AdminFailure(errMessage: l.errMessage));
      },
      (r) {
        allLabs = r.where((lab) => lab.state == true).toList();
        labRequests = r.where((lab) => lab.state == false).toList();
        emit(AdminSuccess());
      },
    );
  }

  Future<void> deleteDoctor({required String id, required String token}) async {
    await adminRepo.deleteDoctor(token: token, id: id);
  }

  Future<void> deleteLab({required String id, required String token}) async {
    await adminRepo.deleteLab(token: token, id: id);
  }

  Future<void> approve({required String token, required dynamic body}) async {
    await adminRepo.approve(token: token, body: body);
  }

  Future<void> dcline({required String token, required dynamic body}) async {
    await adminRepo.decline(token: token, body: body);
  }
}
