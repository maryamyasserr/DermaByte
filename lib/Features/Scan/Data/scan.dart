class ScanModel {
  String? id;
  DateTime scanDate;
  String diseasePhoto;
  String diseaseName;
  String patient;

  ScanModel({
    this.id,
    required this.scanDate,
    required this.diseasePhoto,
    required this.diseaseName,
    required this.patient,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json['id'] as String?,
        scanDate: DateTime.parse(json['scanDate'] as String),
        diseasePhoto: json['diseasePhoto'] as String,
        diseaseName: json['diseaseName'] as String,
        patient: json['patient'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'scanDate': scanDate.toIso8601String(),
        'diseasePhoto': diseasePhoto,
        'diseaseName': diseaseName,
        'patient': patient,
      };
}
