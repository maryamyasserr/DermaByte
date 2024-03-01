class Scan {
  String? id;
  String? diseasePhoto;
  String? diseaseName;

  Scan({this.id, this.diseasePhoto, this.diseaseName});

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        id: json['_id'] as String?,
        diseasePhoto: json['diseasePhoto'] as String?,
        diseaseName: json['diseaseName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'diseasePhoto': diseasePhoto,
        'diseaseName': diseaseName,
      };
}
