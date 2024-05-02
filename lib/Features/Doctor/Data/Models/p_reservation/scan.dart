class Scan {
  String? id;
  String? diseasePhoto;
  String? diseaseName;

  Scan({this.id, this.diseasePhoto, this.diseaseName});

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        diseasePhoto: json['diseasePhoto'] as String?,
        diseaseName: json['diseaseName'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'diseasePhoto': diseasePhoto,
        'diseaseName': diseaseName,
        'id': id,
      };
}
