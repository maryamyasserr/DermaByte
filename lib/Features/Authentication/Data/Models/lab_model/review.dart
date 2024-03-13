import 'patient.dart';

class Review {
  String? id;
  String? title;
  int? ratings;
  Patient? patient;
  String? lab;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Review({
    this.id,
    this.title,
    this.ratings,
    this.patient,
    this.lab,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        ratings: json['ratings'] as int?,
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
        lab: json['lab'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'ratings': ratings,
        'patient': patient?.toJson(),
        'lab': lab,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
