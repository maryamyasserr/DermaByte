class LabReservation {
  DateTime? date;
  String? patient;
  String? lab;
  List<String>? test;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;


  LabReservation({
    this.date,
    this.patient,
    this.lab,
    this.test,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory LabReservation.fromJson(Map<String, dynamic> json) {
    return LabReservation(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      patient: json['patient'] as String?,
      lab: json['lab'] as String?,
      test: json['test'] as List<String>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'patient': patient,
        'lab': lab,
        'test': test,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
