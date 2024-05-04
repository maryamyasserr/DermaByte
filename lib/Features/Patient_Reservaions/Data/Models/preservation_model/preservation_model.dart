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
  List<Scan> scan;
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
        id: json['id'] as String?,
        meetingUrl: json['meetingUrl'] as String?,
        date: json['date'] = DateTime.parse(json['date'] as String),
        uploadedTest: json['uploadedTest'] as dynamic,
        patient: json['patient'] =
            Patient.fromJson(json['patient'] as Map<String, dynamic>),
        dermatologist: json['dermatologist'] = Dermatologist.fromJson(
            json['dermatologist'] as Map<String, dynamic>),
        scan: (json['scan'] as List<dynamic>?)!
            .map((e) => Scan.fromJson(e as Map<String, dynamic>))
            .toList(),
        tests: json['tests'] as List?);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'uploadedTest': uploadedTest,
        'meetingUrl': meetingUrl,
        'patient': patient.toJson(),
        'dermatologist': dermatologist.toJson(),
        'scan': scan.map((e) => e.toJson()).toList(),
        'tests': tests
      };

  Map<String, dynamic> toJson2() => {
        'id': id,
        'date': date.toIso8601String(),
        'meetingUrl': meetingUrl,
        'uploadedTest': uploadedTest,
        'patient': patient.toJson(),
        'dermatologist': dermatologist.toJson(),
        'scan': scan.map((e) => e.toJson()).toList(),
        'tests': tests
      };
}
