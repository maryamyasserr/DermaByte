import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'consults_state.dart';

class ConsultsCubit extends Cubit<ConsultsState> {
  ConsultsCubit() : super(ConsultsInitial());
}
