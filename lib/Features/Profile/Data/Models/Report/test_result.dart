import 'lab.dart';

class TestResult {
  String? id;
  String? testName;
  List<dynamic>? testResult;
  Lab? lab;

  TestResult({this.id, this.testName, this.testResult, this.lab});

  factory TestResult.fromJson(Map<String, dynamic> json) => TestResult(
        testName: json['testName'] as String?,
        testResult: json['testResult'] as List<dynamic>?,
        lab: json['lab'] == null
            ? null
            : Lab.fromJson(json['lab'] as Map<String, dynamic>),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'testResult': testResult,
        'lab': lab?.toJson(),
        'id': id,
      };
}
