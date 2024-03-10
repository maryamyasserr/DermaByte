import 'dermatologist.dart';
import 'patient.dart';
import 'scan.dart';

class MyReservaionModel {
  DateTime? date;
  List<dynamic>? uploadedTest;
  bool? reviewed;
  Patient? patient;
  Dermatologist? dermatologist;
  Scan? scan;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  MyReservaionModel({
    this.id,
    this.date,
    this.uploadedTest,
    this.reviewed,
    this.patient,
    this.dermatologist,
    this.scan,
    this.createdAt,
    this.updatedAt,
  });

  factory MyReservaionModel.fromJson(Map<String, dynamic> json) {
    return MyReservaionModel(
     
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'uploadedTest': uploadedTest,
        'reviewed': reviewed,
        'patient': patient?.toJson(),
        'dermatologist': dermatologist?.toJson(),
        'scan': scan?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
      };
}
