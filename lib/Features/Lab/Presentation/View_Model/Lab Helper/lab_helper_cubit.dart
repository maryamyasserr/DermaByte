import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'lab_helper_state.dart';

class LabHelperCubit extends Cubit<LabHelperState> {
  LabHelperCubit() : super(LabHelperInitial());
  List<PlatformFile>? files;
  Future<void> uploadResult() async {
    try {
      files = (await FilePicker.platform.pickFiles(allowMultiple: true))?.files;
      emit(LabHelperSuccess());
    } catch (e) {
      print("Error picking files: $e");
    }
  }

  void removePhoto(PlatformFile photo) {
    files!.remove(photo);
    emit(LabHelperSuccess());
  }
}
