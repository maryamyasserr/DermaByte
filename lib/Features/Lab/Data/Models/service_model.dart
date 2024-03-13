class ServiceModel {
  String? name;
  String? lab;
  int? cost;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? id;

  ServiceModel({
    this.name,
    this.lab,
    this.cost,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        name: json['name'] as String?,
        lab: json['lab']['id'] as String?,
        cost: json['cost'] as int?,
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
        'name': name,
        'lab': lab,
        'cost': cost,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
