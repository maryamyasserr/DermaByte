import 'dermatologist.dart';
import 'patient.dart';
import 'scan.dart';

class ReportModel {
  Scan? scan;
  List<dynamic>? medicine;
  dynamic treatmentPlan;
  dynamic diagnoses;
  Patient? patient;
  Dermatologist? dermatologist;
  List<dynamic>? testResult;
  List<dynamic>? tests;
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
        scan: json['scan'] == null
            ? null
            : Scan.fromJson(json['scan'] as Map<String, dynamic>),
        medicine: json['medicine'] as List<dynamic>?,
        treatmentPlan: json['treatmentPlan'] as dynamic,
        diagnoses: json['diagnoses'] as dynamic,
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        dermatologist: json['dermatologist'] == null
            ? null
            : Dermatologist.fromJson(
                json['dermatologist'] as Map<String, dynamic>),
        testResult: json['testResult'] as List<dynamic>?,
        tests: json['tests'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'scan': scan?.toJson(),
        'medicine': medicine,
        'treatmentPlan': treatmentPlan,
        'diagnoses': diagnoses,
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'testResult': testResult,
        'tests': tests,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
      };
}
