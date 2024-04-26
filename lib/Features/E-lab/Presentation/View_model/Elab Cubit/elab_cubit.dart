import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model/lab_model.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo.dart';
import 'package:meta/meta.dart';

part 'elab_state.dart';

class ELabCubit extends Cubit<LabState> {
  ElabRepo labRepo;
  ELabCubit(this.labRepo) : super(LabInitial());

  List<LabModel> allLabs = [];
  String? labId;

  Future<void> getAllLabs({required String token}) async {
    emit(LabLoading());
    var response = await labRepo.getAllLabs(token: token);
    response.fold((failure) {
      emit(LabFailure(errMessage: failure.errMessage));
    }, (labs) {
      emit(LabSuccess(labs: labs));
      allLabs = labs;
    });
  }

  set setId(String id) {
    labId = id;
  }

  LabModel? get currentLab {
    try {
      return allLabs.firstWhere((lab) => lab.id == labId);
    } catch (e) {
      return null;
    }
  }
}
