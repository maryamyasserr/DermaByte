
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'lab_helper_state.dart';

class LabHelperCubit extends Cubit<LabHelperState> {
  LabHelperCubit() : super(LabHelperInitial());
  PlatformFile? imgPath;
  Future<void> uploadResult() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // type: FileType.image,
        allowMultiple: true);
    if (result != null && result.files.isNotEmpty) {
      imgPath = result.files.first;
      emit(LabHelperSuccess());
    } else {}
  }

  void removePhoto() {
    imgPath = null;
      emit(LabHelperSuccess());
  }
}
