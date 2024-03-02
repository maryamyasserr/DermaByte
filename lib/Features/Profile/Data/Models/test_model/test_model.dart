import 'lab.dart';

class TestModel {
  String? id;
  String testName;
  String testResult;
  DateTime testDate;
  String patient;
  Lab lab;

  TestModel({
    this.id,
   required this.testName,
   required this.testResult,
   required this.testDate,
   required this.patient,
   required this.lab,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json['id'] as String?,
        testName: json['testName'] as String,
        testResult: json['testResult'] as String,
        testDate: DateTime.parse(json['testDate'] as String),
        patient: json['patient'] as String,
        lab: Lab.fromJson(json['lab'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'testName': testName,
        'testResult': testResult,
        'testDate': testDate.toIso8601String(),
        'patient': patient,
        'lab': lab.toJson(),
       
      };
}
