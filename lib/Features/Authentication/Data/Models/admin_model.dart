class AdminModel {
  String? id;
  String? email;
  String? role;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? firstName;

  AdminModel({
    this.id,
    this.email,
    this.role,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.firstName,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        email: json['email'] as String?,
        role: json['role'] as String?,
        active: json['active'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        firstName: json['firstName'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'role': role,
        'active': active,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'firstName': firstName,
        'id': id,
      };
}
