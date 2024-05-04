import 'package:image_picker/image_picker.dart';

class UploadedTestModel {
  final String testName;
  final List<XFile> testsFiles;


  UploadedTestModel({required this.testName, required this.testsFiles});
}
