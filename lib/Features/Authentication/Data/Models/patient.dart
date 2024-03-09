class PatientModel {
  String? firstName;
  String? lastName;
  int? age;
  String? city;
  String? country;
  String? gender;
  String? email;
  String? password;
  String? role;
  bool? active;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  PatientModel({
    this.firstName,
    this.lastName,
    this.age,
    this.city,
    this.country,
    this.gender,
    this.email,
    this.password,
    this.role,
    this.active,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        age: json['age'] as int?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        gender: json['gender'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        role: json['role'] as String?,
        active: json['active'] as bool?,
        slug: json['slug'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'city': city,
        'country': country,
        'gender': gender,
        'email': email,
        'password': password,
        'role': role,
        'active': active,
        'slug': slug,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'id': id,
      };
}
