class DoctorModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? mobile;
  String? location;
  String? city;
  String? country;
  String? specialization;
  List<dynamic>? license;
  String? email;
  String? password;
  String? passwordConfirm;
  String? profilePic;
  int? sessionCost;
  bool? state;
  bool? active;
  String? slug;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? id;

  DoctorModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.mobile,
    this.location,
    this.city,
    this.country,
    this.specialization,
    this.license,
    this.email,
    this.password,
    this.passwordConfirm,
    this.profilePic,
    this.sessionCost,
    this.state,
    this.active,
    this.slug,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        gender: json['gender'] as String?,
        mobile: json['mobile'] as String?,
        location: json['location'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        specialization: json['specialization'] as String?,
        license: json['license'] as List<dynamic>?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        passwordConfirm: json['passwordConfirm'] as String?,
        profilePic: json['profilePic'] as String?,
        sessionCost: json['sessionCost'] as int?,
        state: json['state'] as bool?,
        active: json['active'] as bool?,
        slug: json['slug'] as String?,
        role: json['role'] as String?,
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
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'mobile': mobile,
        'location': location,
        'city': city,
        'country': country,
        'specialization': specialization,
        'license': license,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'profilePic': profilePic,
        'sessionCost': sessionCost,
        'state': state,
        'active': active,
        'slug': slug,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
