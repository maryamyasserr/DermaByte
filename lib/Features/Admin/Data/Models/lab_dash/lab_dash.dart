import 'service.dart';

class LabDash {
  String? firstName;
  String? profilePic;
  String? location;
  String? city;
  String? country;
  List<dynamic>? license;
  String? email;
  String? password;
  bool? state;
  String? role;
  bool? active;
  String? slug;
  int? ratingsQuantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Service>? services;
  List<dynamic>? reviews;
  String? id;

  LabDash({
    this.firstName,
    this.profilePic,
    this.location,
    this.city,
    this.country,
    this.license,
    this.email,
    this.password,
    this.state,
    this.role,
    this.active,
    this.slug,
    this.ratingsQuantity,
    this.createdAt,
    this.updatedAt,
    this.services,
    this.reviews,
    this.id,
  });

  factory LabDash.fromJson(Map<String, dynamic> json) => LabDash(
        firstName: json['firstName'] as String?,
        profilePic: json['profilePic'] as String?,
        location: json['location'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        license: json['license'] as List<dynamic>?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        state: json['state'] as bool?,
        role: json['role'] as String?,
        active: json['active'] as bool?,
        slug: json['slug'] as String?,
        ratingsQuantity: json['ratingsQuantity'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        services: (json['Services'] as List<dynamic>?)
            ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
            .toList(),
        reviews: json['reviews'] as List<dynamic>?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'profilePic': profilePic,
        'location': location,
        'city': city,
        'country': country,
        'license': license,
        'email': email,
        'password': password,
        'state': state,
        'role': role,
        'active': active,
        'slug': slug,
        'ratingsQuantity': ratingsQuantity,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'Services': services?.map((e) => e.toJson()).toList(),
        'reviews': reviews,
        'id': id,
      };
}
