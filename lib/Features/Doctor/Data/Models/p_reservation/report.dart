import 'dermatologist.dart';
import 'patient.dart';
import 'scan.dart';

class Report {
  String? id;
  Scan? scan;
  Patient? patient;
  Dermatologist? dermatologist;
  List<dynamic>? testResult;

  Report({
    this.id,
    this.scan,
    this.patient,
    this.dermatologist,
    this.testResult,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
       
        scan: json['scan'] == null
            ? null
            : Scan.fromJson(json['scan'] as Map<String, dynamic>),
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        dermatologist: json['dermatologist'] == null
            ? null
            : Dermatologist.fromJson(
                json['dermatologist'] as Map<String, dynamic>),
        testResult: json['testResult'] as List<dynamic>?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'scan': scan?.toJson(),
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'testResult': testResult,
        'id': id,
      };
}
