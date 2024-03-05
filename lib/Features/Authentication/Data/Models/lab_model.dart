class LabModel {
  String? name;
  String? mobile;
  String? location;
  String? city;
  String? country;
  List<dynamic>? license;
  String? email;
  String? password;
  String? passwordConfirm;
  bool? state;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? services;
  String? id;

  LabModel({
    this.name,
    this.mobile,
    this.location,
    this.city,
    this.country,
    this.license,
    this.email,
    this.password,
    this.passwordConfirm,
    this.state,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.services,
    this.id,
  });

  factory LabModel.fromJson(Map<String, dynamic> json) => LabModel(
        name: json['name'] as String?,
        mobile: json['mobile'] as String?,
        location: json['location'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        license: json['license'] as List<dynamic>?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        passwordConfirm: json['passwordConfirm'] as String?,
        state: json['state'] as bool?,
        slug: json['slug'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        services: json['Services'] as List<dynamic>?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'mobile': mobile,
        'location': location,
        'city': city,
        'country': country,
        'license': license,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'state': state,
        'slug': slug,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'Services': services,
        'id': id,
      };
}
