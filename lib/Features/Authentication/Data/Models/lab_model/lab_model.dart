import 'review.dart';
import 'service.dart';

class LabModel {
  String? firstName;
  String? mobile;
  String? location;
  String? profilePic;
  String? city;
  String? country;
  List<dynamic>? license;
  String? email;
  String? password;
  bool? state;
  String? role;
  bool? active;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? ratingsAverage;
  int? ratingsQuantity;
  List<Service>? services;
  List<Review>? reviews;
  String? id;

  LabModel({
    this.firstName,
    this.mobile,
    this.location,
    this.city,
    this.profilePic,
    this.country,
    this.license,
    this.email,
    this.password,
    this.state,
    this.role,
    this.active,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.services,
    this.reviews,
    this.id,
  });

  factory LabModel.fromJson(Map<String, dynamic> json) => LabModel(
        firstName: json['firstName'] as String?,
        mobile: json['mobile'] as String?,
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
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
        ratingsQuantity: json['ratingsQuantity'] as int?,
        services: (json['Services'] as List<dynamic>?)
            ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
            .toList(),
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'mobile': mobile,
        'location': location,
        'city': city,
        'profilePic':profilePic,
        'country': country,
        'license': license,
        'email': email,
        'password': password,
        'state': state,
        'role': role,
        'active': active,
        'slug': slug,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'ratingsAverage': ratingsAverage,
        'ratingsQuantity': ratingsQuantity,
        'Services': services?.map((e) => e.toJson()).toList(),
        'reviews': reviews?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
