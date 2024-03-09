import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo.dart';
import 'package:meta/meta.dart';

part 'edoctor_state.dart';

class EdoctorCubit extends Cubit<EdoctorState> {
  EdoctorRepo edoctorRepo;
  EdoctorCubit(this.edoctorRepo) : super(EdoctorInitial());
  Future<void> getAllDoctors({required String token}) async {
    emit(EdoctorLoading());
    var response = await edoctorRepo.getAllDoctors(token: token);
    response.fold((failure) {
      emit(EdoctorFailure(errMessage: failure.errMessage));
    }, (doctors) {
      emit(EdoctorSuccess(doctors: doctors));
    });
  }
}
