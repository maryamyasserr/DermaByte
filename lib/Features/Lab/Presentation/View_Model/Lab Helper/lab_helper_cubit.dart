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
  List<List<XFile>> allUploadedTests = [];

  Future<void> uploadTests({required int index}) async {
    final List<XFile> pickedFile = await ImagePicker().pickMultiImage();
    if (allUploadedTests[index].isEmpty) {
      allUploadedTests[index] = pickedFile;
      emit(LabHelperSuccess());
    } else {
      for (var e in pickedFile) {
        bool exists = allUploadedTests[index]
            .any((existingFile) => existingFile.name == e.name);
        if (!exists) {
          allUploadedTests[index].add(e);
        }
      }
      emit(LabHelperFailure());
    }
  }

  void removePhoto(index, XFile test) {
    allUploadedTests[index].remove(test);
    emit(LabHelperSuccess());
  }

  void allTest(List<Test> patientTest) {
    // String tests = '';
    for (var item in patientTest) {
      if (allTests.contains(item.name)) {
      } else {
        allTests.add(item.name!);
      }
    }
    // tests = allTests.join(',');
  }
}
