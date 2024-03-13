import 'lab.dart';

class Service {
  String? name;
  Lab? lab;
  int? cost;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? id;

  Service({
    this.name,
    this.lab,
    this.cost,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json['name'] as String?,
        lab: json['lab'] == null
            ? null
            : Lab.fromJson(json['lab'] as Map<String, dynamic>),
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
        'lab': lab?.toJson(),
        'cost': cost,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
