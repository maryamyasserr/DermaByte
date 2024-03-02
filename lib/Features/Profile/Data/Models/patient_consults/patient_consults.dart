import 'dermatologist.dart';
import 'patient.dart';
import 'test.dart';

class PatientConsultsModel {
  String? id;
  String scan;
  dynamic medicine;
  dynamic treatmentPlan;
  dynamic diagnoses;
  Patient patient;
  Dermatologist dermatologist;
  List<Test>? tests;

  PatientConsultsModel({
    this.id,
    required this.scan,
    this.medicine,
    this.treatmentPlan,
    this.diagnoses,
    required this.patient,
    required this.dermatologist,
    this.tests,
  });

  factory PatientConsultsModel.fromJson(Map<String, dynamic> json) {
    return PatientConsultsModel(
      id: json['id'] as String?,
      scan: json['scan'] as String,
      medicine: json['medicine'] as dynamic,
      treatmentPlan: json['treatmentPlan'] as dynamic,
      diagnoses: json['diagnoses'] as dynamic,
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      dermatologist:
          Dermatologist.fromJson(json['dermatologist'] as Map<String, dynamic>),
      tests: (json['tests'] as List<dynamic>?)
          ?.map((e) => Test.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'scan': scan,
        'medicine': medicine,
        'treatmentPlan': treatmentPlan,
        'diagnoses': diagnoses,
        'patient': patient.toJson(),
        'dermatologist': dermatologist.toJson(),
        'tests': tests?.map((e) => e.toJson()).toList(),
      };
}
