import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/lab_repo.dart';
import 'package:meta/meta.dart';

part 'lab_details_state.dart';

class LabDetailsCubit extends Cubit<LabDetailsState> {
  LabRepo labRepo;
  LabDetailsCubit(this.labRepo) : super(LabDetailsInitial());

  Future<void> getLabDetails({required dynamic id}) async {
    emit(LabDetailsLoading());
    var response = await labRepo.getLabDetails(id: id);
    response.fold((failure) {
      emit(LabDetailsFailure(errMessage: failure.errMessage));
    }, (labDetails) {
      emit(LabDetailsSuccess(labDetails: labDetails));
    });
  }
}
