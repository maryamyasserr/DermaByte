import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/lab_repo.dart';
import 'package:meta/meta.dart';

part 'lab_state.dart';

class ELabCubit extends Cubit<LabState> {
  LabRepo labRepo;
  ELabCubit(this.labRepo) : super(LabInitial());

  List<LabModel> allLabs = [];
  String? _id;

  Future<void> getAllLabs() async {
    emit(LabLoading());
    var response = await labRepo.getAllLabs();
    response.fold((failure) {
      emit(LabFailure(errMessage: failure.errMessage));
    }, (labs) {
      emit(LabSuccess(labs: labs));
      allLabs = labs;
    });
  }

  set setId(String id) {
    _id = id;
  }

  LabModel get currentLab => allLabs.firstWhere((lab) => lab.id == _id);
}
