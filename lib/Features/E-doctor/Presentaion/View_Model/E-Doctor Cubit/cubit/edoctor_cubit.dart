import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor/Data/Repos/edoctor_repo.dart';
import 'package:meta/meta.dart';

part 'edoctor_state.dart';

class EdoctorCubit extends Cubit<EdoctorState> {
  EdoctorRepo edoctorRepo;
  EdoctorCubit(this.edoctorRepo) : super(EdoctorInitial());
  Future<void> getAllDoctors() async {
    emit(EdoctorLoading());
    var response = await edoctorRepo.getAllDoctors();
    response.fold((failure) {
      emit(EdoctorFailure(errMessage: failure.errMessage));
    }, (doctors) {
      emit(EdoctorSuccess(doctors: doctors));
    });
  }
}
