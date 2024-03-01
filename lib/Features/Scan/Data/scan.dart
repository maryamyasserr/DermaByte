class Scan {
  String? id;
  DateTime? scanDate;
  String? diseasePhoto;
  String? diseaseName;
  String? patient;
  DateTime? createdAt;
  DateTime? updatedAt;

  Scan({
    this.id,
    this.scanDate,
    this.diseasePhoto,
    this.diseaseName,
    this.patient,
    this.createdAt,
    this.updatedAt,
  });

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        id: json['id'] as String?,
        scanDate: json['scanDate'] == null
            ? null
            : DateTime.parse(json['scanDate'] as String),
        diseasePhoto: json['diseasePhoto'] as String?,
        diseaseName: json['diseaseName'] as String?,
        patient: json['patient'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'scanDate': scanDate?.toIso8601String(),
        'diseasePhoto': diseasePhoto,
        'diseaseName': diseaseName,
        'patient': patient,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
