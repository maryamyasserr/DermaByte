class UploadedTest {
  String? testName;
  List<dynamic>? testResult;
  String? id;

  UploadedTest({this.testName, this.testResult, this.id});

  factory UploadedTest.fromJson(Map<String, dynamic> json) => UploadedTest(
        testName: json['testName'] as String?,
        testResult: json['testResult'] as List<dynamic>?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'testResult': testResult,
        'id': id,
      };
}
