import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'lab_helper_state.dart';

class LabHelperCubit extends Cubit<LabHelperState> {
  LabHelperCubit() : super(LabHelperInitial());
  List<XFile> testResults = [];
  List<String> allTests = [];
  Future<void> uploadResult() async {
    final List<XFile> pickedFile = await ImagePicker().pickMultiImage();
    if (testResults.isEmpty) {
      testResults = pickedFile;
      emit(LabHelperSuccess());
    } else {
      for (var e in pickedFile) {
        bool exists =
            testResults.any((existingFile) => existingFile.name == e.name);
        if (!exists) {
          testResults.add(e);
        }
      }
      emit(LabHelperFailure());
    }
  }

  void removePhoto(XFile photo) {
    testResults.remove(photo);
    emit(LabHelperSuccess());
  }

  List<String> allTest(List<Test> patientTest) {
    // String tests = '';
    for (var item in patientTest) {
      allTests.add(item.name!);
    }
    // tests = allTests.join(',');

    return allTests;
  }
}
