import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/uploadedTestModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'lab_helper_state.dart';

class LabHelperCubit extends Cubit<LabHelperState> {
  LabHelperCubit() : super(LabHelperInitial());

  List<UploadedTestModel> results = [];
  List<UploadedTestModel> allResutls = [];

  void addTestResult(UploadedTestModel uploadedTestModel) {
    int existingIndex = results
        .indexWhere((test) => test.testName == uploadedTestModel.testName);
    if (existingIndex != -1) {
      UploadedTestModel existingTest = results[existingIndex];
      List<XFile> updatedFiles = [...existingTest.testsFiles];
      for (XFile file in uploadedTestModel.testsFiles) {
        String filePath = file.name;
        if (!updatedFiles
            .any((existingFile) => existingFile.name == filePath)) {
          updatedFiles.add(file);
        }
      }
      UploadedTestModel updatedTest = UploadedTestModel(
        testName: uploadedTestModel.testName,
        testsFiles: updatedFiles,
      );
      results[existingIndex] = updatedTest;
      emit(LabHelperSuccess());
    } else {
      results.add(uploadedTestModel);
      emit(LabHelperSuccess());
    }
  }

  configData() {
    for (var e in results) {
      if (e.testsFiles.isEmpty) {
      } else {
        allResutls.add(e);
      }
    }
  }

  void removeTestResult(List<XFile> tests, XFile test) {
    tests.remove(test);
    emit(LabHelperSuccess());
  }
}
