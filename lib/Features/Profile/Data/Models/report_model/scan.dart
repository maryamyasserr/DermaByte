class Scan {
  DateTime? scanDate;
  String? diseasePhoto;
  String? diseaseName;
  String? id;

  Scan({
    this.scanDate,
    this.diseasePhoto,
    this.diseaseName,
    this.id,
  });

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        scanDate: json['scanDate'] == null
            ? null
            : DateTime.parse(json['scanDate'] as String),
        diseasePhoto: json['diseasePhoto'] as String?,
        diseaseName: json['diseaseName'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'scanDate': scanDate?.toIso8601String(),
        'diseasePhoto': diseasePhoto,
        'diseaseName': diseaseName,
        'id': id,
      };
}
