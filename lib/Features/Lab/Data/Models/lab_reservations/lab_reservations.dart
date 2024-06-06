import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab.dart';

import 'patient.dart';
import 'test.dart';

class LabReservations {
  String? id;
  DateTime? date;
  Patient? patient;
  Lab? lab;
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
        id: json['id'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        lab: json['lab'] == null
            ? null
            : Lab.fromJson(json['lab'] as Map<String, dynamic>),
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
        'id': id,
        'date': date?.toIso8601String(),
        'patient': patient?.toJson(),
        'lab': lab,
        'test': test?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
