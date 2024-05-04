import 'dermatologist.dart';
import 'patient.dart';
import 'scan.dart';
import 'test.dart';
import 'test_result.dart';

class ReportModel {
  List<Scan>? scan;
  List<dynamic>? medicine;
  List<dynamic>? treatmentPlan;
  dynamic diagnoses;
  Patient? patient;
  Dermatologist? dermatologist;
  List<TestResult>? testResult;
  List<Test>? tests;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  ReportModel({
    this.scan,
    this.medicine,
    this.treatmentPlan,
    this.diagnoses,
    this.patient,
    this.dermatologist,
    this.testResult,
    this.tests,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        scan: (json['scan'] as List<dynamic>?)!
            .map((e) => Scan.fromJson(e as Map<String, dynamic>))
            .toList(),
        medicine: json['medicine'] as List<dynamic>?,
        treatmentPlan: json['treatmentPlan'] as List<dynamic>?,
        diagnoses: json['diagnoses'] as dynamic,
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        dermatologist: json['dermatologist'] == null
            ? null
            : Dermatologist.fromJson(
                json['dermatologist'] as Map<String, dynamic>),
        testResult: (json['testResult'] as List<dynamic>?)
            ?.map((e) => TestResult.fromJson(e as Map<String, dynamic>))
            .toList(),
        tests: (json['tests'] as List<dynamic>?)
            ?.map((e) => Test.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'scan': scan!.map((e) => e.toJson()).toList(),
        'medicine': medicine,
        'treatmentPlan': treatmentPlan,
        'diagnoses': diagnoses,
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'testResult': testResult?.map((e) => e.toJson()).toList(),
        'tests': tests?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
      };
}
