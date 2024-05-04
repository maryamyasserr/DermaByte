import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/test.dart';
import 'package:dermabyte/Features/Lab/Data/Models/uploadedTestModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'lab_helper_state.dart';

class LabHelperCubit extends Cubit<LabHelperState> {
  LabHelperCubit() : super(LabHelperInitial());

  List<String> allTests = [];

  List<UploadedTestModel> allUploadedResults = [];

    Future<void> uploadExternalTests(index) async {
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
      emit(LabHelperSuccess());
    }
  }

  List<List<XFile>> allUploadedTests = [];

  void getLengthTets(int count) {
    allUploadedTests.clear();
    for (int i = 0; i < count; i++) {
      allUploadedTests.add([]);
    }
  }

  void removeTest(index, XFile test) {
    allUploadedTests[index].remove(test);
   emit(LabHelperSuccess());
  }






  List<String> allTest(List<Test> patientTest) {
    // String tests = '';
    for (var item in patientTest) {
      if (allTests.contains(item.name)) {
      } else {
        allTests.add(item.name!);
      }
    }
    // tests = allTests.join(',');
    return allTests;
  }



}
