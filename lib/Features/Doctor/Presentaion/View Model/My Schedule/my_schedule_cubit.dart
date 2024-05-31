import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_schedule_state.dart';

class MyScheduleCubit extends Cubit<MyScheduleState> {
  MyScheduleCubit() : super(MyScheduleInitial());
}
