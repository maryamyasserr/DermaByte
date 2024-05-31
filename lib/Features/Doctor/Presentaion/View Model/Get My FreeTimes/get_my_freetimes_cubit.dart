import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_free_time_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:meta/meta.dart';

part 'get_my_freetimes_state.dart';

class GetMyFreeTimesDCubit extends Cubit<GetMyFreeTimesDState> {
  GetMyFreeTimesDCubit(this.doctorRepo) : super(GetMyFreeTimesInitial());
  DoctorRepo doctorRepo;
  Future<void> getMySchedule({required String token}) async {
    emit(GetMyFreeTiemsLoading());
    var response = await doctorRepo.getMyFreeTimesD(token: token);
    response.fold((failure) => emit(GetMyFreeTimesFailure()),
        (data) => emit(GetMyFreeTimesSuccess(data)));
  }
}
