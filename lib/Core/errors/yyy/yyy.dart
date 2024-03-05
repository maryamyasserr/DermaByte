import 'lab.dart';

class Yyy {
  String? testName;
  List<String>? testResult;
  DateTime? testDate;
  String? patient;
  Lab? lab;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  Yyy({
    this.testName,
    this.testResult,
    this.testDate,
    this.patient,
    this.lab,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Yyy.fromJson(Map<String, dynamic> json) => Yyy(
        testName: json['testName'] as String?,
        testResult: json['testResult'] as List<String>?,
        testDate: json['testDate'] == null
            ? null
            : DateTime.parse(json['testDate'] as String),
        patient: json['patient'] as String?,
        lab: json['lab'] == null
            ? null
            : Lab.fromJson(json['lab'] as Map<String, dynamic>),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'testResult': testResult,
        'testDate': testDate?.toIso8601String(),
        'patient': patient,
        'lab': lab?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
      };
}
