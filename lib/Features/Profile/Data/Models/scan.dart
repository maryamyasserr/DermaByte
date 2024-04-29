class ScanModel {
  String? id;
  DateTime scanDate;
  String dieseasePhoto;
  String dieseaseName;
  String patient;

  ScanModel({
    this.id,
    required this.scanDate,
    required this.dieseasePhoto,
    required this.dieseaseName,
    required this.patient,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json['id'] as String?,
        scanDate: DateTime.parse(json['scanDate'] as String),
        dieseasePhoto: json['dieseasePhoto'] as String,
        dieseaseName: json['dieseaseName'] as String,
        patient: json['patient'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'scanDate': scanDate.toIso8601String(),
        'dieseasePhoto': dieseasePhoto,
        'dieseaseName': dieseaseName,
        'patient': patient,
      };
}
