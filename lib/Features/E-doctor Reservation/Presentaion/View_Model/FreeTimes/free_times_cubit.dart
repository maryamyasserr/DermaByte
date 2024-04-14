import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Models/free_time_model.dart';
import 'package:meta/meta.dart';

part 'free_times_state.dart';

class FreeTimesCubit extends Cubit<FreeTimesState> {
  FreeTimesCubit() : super(FreeTimesInitial());
}
