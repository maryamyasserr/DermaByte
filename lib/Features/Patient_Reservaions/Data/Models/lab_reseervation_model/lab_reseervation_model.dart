import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/test.dart';

import 'lab.dart';
import 'patient.dart';

class PLabReservationModel {
  String? id;
  DateTime? date;
  String? completed;
  Patient? patient;
  Lab? lab;
  List<Test>? test;
  DateTime? createdAt;
  DateTime? updatedAt;

  PLabReservationModel({
    this.id,
    this.date,
    this.completed,
    this.patient,
    this.lab,
    this.test,
    this.createdAt,
    this.updatedAt,
  });

  factory PLabReservationModel.fromJson(Map<String, dynamic> json) {
    return PLabReservationModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      completed: json['completed'] as String?,
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
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'completed': completed,
        'patient': patient?.toJson(),
        'lab': lab?.toJson(),
        'test': test?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
      };
}
