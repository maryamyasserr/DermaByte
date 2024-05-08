class Service {
  String? id;
  String? name;

  int? cost;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Service({
    this.id,
    this.name,
    this.cost,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json['name'] as String?,
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
        'cost': cost,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
