import 'dermatologist.dart';
import 'patient.dart';
import 'scan.dart';
import 'test.dart';

class ReportModel {
  String? id;
  Scan? scan;
  List<dynamic>? medicine;
  dynamic treatmentPlan;
  dynamic diagnoses;
  Patient? patient;
  Dermatologist? dermatologist;
  List<Test>? tests;

  ReportModel({
    this.id,
    this.scan,
    this.medicine,
    this.treatmentPlan,
    this.diagnoses,
    this.patient,
    this.dermatologist,
    this.tests,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
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
      tests: (json['tests'] as List<dynamic>?)
          ?.map((e) => Test.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'scan': scan?.toJson(),
        'medicine': medicine,
        'treatmentPlan': treatmentPlan,
        'diagnoses': diagnoses,
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'tests': tests?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
