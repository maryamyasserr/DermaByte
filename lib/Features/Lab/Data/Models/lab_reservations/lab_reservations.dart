import 'patient.dart';
import 'test.dart';

class LabReservations {
  String? id;
  DateTime? date;
  Patient? patient;
  String? lab;
  List<Test>? test;
  DateTime? createdAt;
  DateTime? updatedAt;

  LabReservations({
    this.id,
    this.date,
    this.patient,
    this.lab,
    this.test,
    this.createdAt,
    this.updatedAt,
  });

  factory LabReservations.fromJson(Map<String, dynamic> json) =>
      LabReservations(
        id: json['_id'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        lab: json['lab'] as String?,
        test: (json['test'] as List<dynamic>?)
            ?.map((e) => Test.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'date': date?.toIso8601String(),
        'patient': patient?.toJson(),
        'lab': lab,
        'test': test?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
