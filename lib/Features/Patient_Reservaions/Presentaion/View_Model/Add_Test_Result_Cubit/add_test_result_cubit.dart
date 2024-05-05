import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/uploadedTestModel.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_test_result_state.dart';

class AddTestResultCubit extends Cubit<AddTestResultState> {
  AddTestResultCubit(this.preservationInfoRepo) : super(AddTestResultInitial());
  PreservationInfoRepo preservationInfoRepo;

  bool isLoading = false;

  List<UploadedTestModel> allTestResults = [];

  Future<void> addTestResult(
      {required String id, token, required dynamic body}) async {
    emit(AddTestResultLoading());
    isLoading = true;
    var response = await preservationInfoRepo.addTestResult(
        id: id, body: body, token: token);
    response.fold((failure) {
      emit(AddTestResultFailure(errMessage: failure.errMessage));
      isLoading = false;
    }, (data) {
      emit(AddTestResultSuccess());
      isLoading = false;
    });
  }

  Future<void> uploadExternalTests(index) async {
    final List<XFile> pickedFile = await ImagePicker().pickMultiImage();
    if (allUploadedTests[index].isEmpty) {
      allUploadedTests[index] = pickedFile;
      emit(AddTestResultSuccess());
    } else {
      for (var e in pickedFile) {
        bool exists = allUploadedTests[index]
            .any((existingFile) => existingFile.name == e.name);
        if (!exists) {
          allUploadedTests[index].add(e);
        }
      }
      emit(AddTestResultSuccess());
    }
  }

  
  void addAllResults(UploadedTestModel uploadedTestModel) {
    int existingIndex = allTestResults
        .indexWhere((test) => test.testName == uploadedTestModel.testName);
    if (existingIndex != -1) {
      UploadedTestModel existingTest = allTestResults[existingIndex];
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
      allTestResults[existingIndex] = updatedTest;
      emit(AddTestResultSuccess());
    } else {
      allTestResults.add(uploadedTestModel);
      emit(AddTestResultSuccess());
    }
  }


 void removeTestResult(String name,List<XFile> tests, XFile test) {
    tests.remove(test);
    if(tests.isEmpty){
       allTestResults.removeWhere((uploadedTestModel) => uploadedTestModel.testName == name);
    }
    emit(AddTestResultSuccess());
  }


  List<List<XFile>> allUploadedTests = [];

  void getLengthTets(int count) {
    allUploadedTests.clear();
    for (int i = 0; i < count; i++) {
      allUploadedTests.add([]);
    }
  }

  void removeLicense(index, XFile test) {
    allUploadedTests[index].remove(test);
    emit(AddTestResultSuccess());
  }
}
