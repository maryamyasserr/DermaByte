import 'dermatologist.dart';
import 'patient.dart';
import 'report.dart';
import 'scan.dart';

class MyReservaionModel {
  String? id;
  DateTime? date;
  List<dynamic>? uploadedTest;
  bool? reviewed;
  Patient? patient;
  Dermatologist? dermatologist;
  Scan? scan;
  String? meetingUrl;
  dynamic symptoms;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? dayName;
  List<Report>? report;

  MyReservaionModel({
    this.id,
    this.date,
    this.uploadedTest,
    this.reviewed,
    this.patient,
    this.dermatologist,
    this.scan,
    this.meetingUrl,
    this.symptoms,
    this.createdAt,
    this.updatedAt,
    this.dayName,
    this.report,
  });

  factory MyReservaionModel.fromJson(Map<String, dynamic> json) => MyReservaionModel(
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        uploadedTest: json['uploadedTest'] as List<dynamic>?,
        reviewed: json['reviewed'] as bool?,
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        dermatologist: json['dermatologist'] == null
            ? null
            : Dermatologist.fromJson(
                json['dermatologist'] as Map<String, dynamic>),
        scan: json['scan'] == null
            ? null
            : Scan.fromJson(json['scan'] as Map<String, dynamic>),
        meetingUrl: json['meetingUrl'] as String?,
        symptoms: json['symptoms'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        dayName: json['dayName'] as String?,
        report: (json['Report'] as List<dynamic>?)
            ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'uploadedTest': uploadedTest,
        'reviewed': reviewed,
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'scan': scan?.toJson(),
        'meetingUrl': meetingUrl,
        'symptoms': symptoms,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'dayName': dayName,
        'Report': report?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
