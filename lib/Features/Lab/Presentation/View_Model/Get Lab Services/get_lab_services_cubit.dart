import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/service_model.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:meta/meta.dart';

part 'get_lab_services_state.dart';

class GetLabServicesCubit extends Cubit<GetLabServicesState> {
  GetLabServicesCubit(this.labRepo) : super(GetLabServicesInitial());
  LabRepo labRepo;

  Future<void> getMyServices({required String token}) async {
    emit(GetLabServicesLoadign());
    var response = await labRepo.getMyServices(token: token);
    response.fold(
        (failure) =>
            emit(GetLabServicesFailure(errMessage: failure.errMessage)),
        (data) => emit(GetLabServicesSuccess(services: data)));
  }
}
