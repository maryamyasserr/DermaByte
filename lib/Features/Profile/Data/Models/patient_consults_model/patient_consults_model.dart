import 'dermatologist.dart';
import 'patient.dart';
import 'scan.dart';
import 'test.dart';

class PatientConsultsModel {
  String? id;
  Scan? scan;
  List<String>? medicine;
  dynamic treatmentPlan;
  dynamic diagnoses;
  Patient? patient;
  Dermatologist? dermatologist;
  List<Test>? tests;
  DateTime? createdAt;
  DateTime? updatedAt;

  PatientConsultsModel({
    this.id,
    this.scan,
    this.medicine,
    this.treatmentPlan,
    this.diagnoses,
    this.patient,
    this.dermatologist,
    this.tests,
    this.createdAt,
    this.updatedAt,
  });

  factory PatientConsultsModel.fromJson(Map<String, dynamic> json) {
    return PatientConsultsModel(
      id: json['id'] as String?,
      scan: json['scan'] == null
          ? null
          : Scan.fromJson(json['scan'] as Map<String, dynamic>),
      medicine: json['medicine'] as List<String>?,
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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
   
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'scan': scan?.toJson(),
        'medicine': medicine,
        'treatmentPlan': treatmentPlan,
        'diagnoses': diagnoses,
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'tests': tests?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
