import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'preservation_info_state.dart';

class PreservationInfoCubit extends Cubit<PreservationInfoState> {
  PreservationInfoCubit() : super(PreservationInfoInitial());
}
