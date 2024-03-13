class ResultModel {
  String? testName;
  List<String>? testResult;
  DateTime? testDate;
  String? patient;
  String? lab;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? id;

  ResultModel({
    this.testName,
    this.testResult,
    this.testDate,
    this.patient,
    this.lab,

    this.createdAt,
    this.updatedAt,
    this.v,
    this.id,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        testName: json['testName'] as String?,
        testResult: json['testResult'] as List<String>?,
        testDate: json['testDate'] == null
            ? null
            : DateTime.parse(json['testDate'] as String),
        patient: json['patient'] as String?,
        lab: json['lab'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'testResult': testResult,
        'testDate': testDate?.toIso8601String(),
        'patient': patient,
        'lab': lab,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
