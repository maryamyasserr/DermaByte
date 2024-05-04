import 'dermatologist.dart';
import 'patient.dart';
import 'report.dart';
import 'scan.dart';

class MyReservaionModel {
  String? id;
  DateTime? date;
  String? dayName;
  List<dynamic>? uploadedTest;
  bool? reviewed;
  String? completed;
  Patient? patient;
  Dermatologist? dermatologist;
  List<Scan>? scan;
  String? meetingUrl;
  dynamic symptoms;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Report>? report;

  MyReservaionModel({
    this.id,
    this.date,
    this.dayName,
    this.uploadedTest,
    this.reviewed,
    this.completed,
    this.patient,
    this.dermatologist,
    this.scan,
    this.meetingUrl,
    this.symptoms,
    this.createdAt,
    this.updatedAt,
    this.report,
  });

  factory MyReservaionModel.fromJson(Map<String, dynamic> json) =>
      MyReservaionModel(
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        dayName: json['dayName'] as String?,
        uploadedTest: json['uploadedTest'] as List<dynamic>?,
        reviewed: json['reviewed'] as bool?,
        completed: json['completed'] as String?,
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        dermatologist: json['dermatologist'] == null
            ? null
            : Dermatologist.fromJson(
                json['dermatologist'] as Map<String, dynamic>),
        scan: (json['scan'] as List<dynamic>?)
            ?.map((e) => Scan.fromJson(e as Map<String, dynamic>))
            .toList(),
        meetingUrl: json['meetingUrl'] as String?,
        symptoms: json['symptoms'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        report: (json['Report'] as List<dynamic>?)
            ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'dayName': dayName,
        'uploadedTest': uploadedTest,
        'reviewed': reviewed,
        'completed': completed,
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'scan': scan?.map((e) => e.toJson()).toList(),
        'meetingUrl': meetingUrl,
        'symptoms': symptoms,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'Report': report?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
