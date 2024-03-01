import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/lab_repo.dart';
import 'package:meta/meta.dart';

part 'lab_state.dart';

class LabCubit extends Cubit<LabState> {
  LabRepo labRepo;
  LabCubit(this.labRepo) : super(LabInitial());

  Future<void> getAllLabs() async {
    emit(LabLoading());
    var response = await labRepo.getAllLabs();
    response.fold((failure) {
      emit(LabFailure(errMessage: failure.errMessage));
    }, (labs) {
      emit(LabSuccess(labs: labs));
    });
  }
}
