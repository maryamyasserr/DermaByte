import 'dermatologist.dart';
import 'patient.dart';
import 'scan.dart';

class PreservationModel {
  String? id;
  String? meetingUrl;
  DateTime date;
  dynamic uploadedTest;
  Patient patient;
  Dermatologist dermatologist;
  Scan scan;
  List? tests;

  PreservationModel(
      {this.id,
      required this.date,
      this.uploadedTest,
      this.meetingUrl,
      required this.patient,
      required this.dermatologist,
      required this.scan,
      this.tests});

  factory PreservationModel.fromJson(Map<String, dynamic> json) {
    return PreservationModel(
        id: json['_id'] as String?,
        meetingUrl: json['meetingUrl'] as String?,
        date: json['date'] = DateTime.parse(json['date'] as String),
        uploadedTest: json['uploadedTest'] as dynamic,
        patient: json['patient'] =
            Patient.fromJson(json['patient'] as Map<String, dynamic>),
        dermatologist: json['dermatologist'] = Dermatologist.fromJson(
            json['dermatologist'] as Map<String, dynamic>),
        scan: json['scan'] =
            Scan.fromJson(json['scan'] as Map<String, dynamic>),
        tests: json['tests'] as List?);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'date': date.toIso8601String(),
        'uploadedTest': uploadedTest,
        'meetingUrl':meetingUrl,
        'patient': patient.toJson(),
        'dermatologist': dermatologist.toJson(),
        'scan': scan.toJson(),
        'tests': tests
      };

  Map<String, dynamic> toJson2() => {
        'date': date.toIso8601String(),
        'meetingUrl':meetingUrl,
        'uploadedTest': uploadedTest,
        'patient': patient.toJson(),
        'dermatologist': dermatologist.toJson(),
        'scan': scan.toJson(),
        'tests': tests
      };
}
