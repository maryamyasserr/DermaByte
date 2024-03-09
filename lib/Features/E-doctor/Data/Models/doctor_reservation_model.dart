class DoctorReservationModel {
  DateTime? date;
  List<String>? uploadedTest;
  bool? reviewed;
  String? patient;
  String? dermatologist;
  String? scan;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? id;

  DoctorReservationModel({
    this.date,
    this.uploadedTest,
    this.reviewed,
    this.patient,
    this.dermatologist,
    this.scan,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory DoctorReservationModel.fromJson(Map<String, dynamic> json) {
    return DoctorReservationModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      uploadedTest: json['uploadedTest'] as List<String>?,
      reviewed: json['reviewed'] as bool?,
      patient: json['patient'] as String?,
      dermatologist: json['dermatologist'] as String?,
      scan: json['scan'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'uploadedTest': uploadedTest,
        'reviewed': reviewed,
        'patient': patient,
        'dermatologist': dermatologist,
        'scan': scan,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
