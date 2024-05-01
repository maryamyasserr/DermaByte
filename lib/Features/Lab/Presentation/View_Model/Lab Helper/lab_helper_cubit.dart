import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/test.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'lab_helper_state.dart';

class LabHelperCubit extends Cubit<LabHelperState> {
  LabHelperCubit() : super(LabHelperInitial());
  List<XFile> testResults=[];
  List<String> allTests = [];
  Future<void> uploadResult() async {
    final List<XFile> pickedFile = await ImagePicker().pickMultiImage();
    if (testResults .isEmpty) {
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

  Future<FormData> formatData({required String patinetId}) async {
    FormData formData = FormData();
    for (int i = 0; i < testResults.length; i++) {
      formData.files.add(
        MapEntry(
          'license',
          await MultipartFile.fromFile(
            testResults[i].path,
            filename: 'docotrLicense$i.jpg',
            contentType: MediaType('image', 'jpeg'),
          ),
        ),
      );
    }
    for (int i = 0; i < allTests.length; i++) {
      formData.fields.addAll([MapEntry("testName", allTests[i])]);
    }
    formData.fields.addAll([MapEntry("patient", patinetId)]);
    return formData;
  }
}
