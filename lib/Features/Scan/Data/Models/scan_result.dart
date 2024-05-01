class ScanResult {
  DateTime? scanDate;
  String? diseasePhoto;
  String? diseaseName;
  String? description;
  String? patient;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ScanResult({
    this.scanDate,
    this.diseasePhoto,
    this.diseaseName,
    this.description,
    this.patient,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ScanResult.fromJson(Map<String, dynamic> json) => ScanResult(
        scanDate: json['scanDate'] == null
            ? null
            : DateTime.parse(json['scanDate'] as String),
        diseasePhoto: json['diseasePhoto'] as String?,
        diseaseName: json['diseaseName'] as String?,
        description: json['description'] as String?,
        patient: json['patient'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'scanDate': scanDate?.toIso8601String(),
        'diseasePhoto': diseasePhoto,
        'diseaseName': diseaseName,
        'description': description,
        'patient': patient,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
