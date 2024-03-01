class Scan {
  String? id;
  String diseasePhoto;
  String diseaseName;

  Scan({this.id, required this.diseasePhoto, required this.diseaseName});

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        id: json['_id'] as String?,
        diseasePhoto: json['diseasePhoto'] as String,
        diseaseName: json['diseaseName'] as String
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'diseasePhoto': diseasePhoto,
        'diseaseName': diseaseName,
      };
}
