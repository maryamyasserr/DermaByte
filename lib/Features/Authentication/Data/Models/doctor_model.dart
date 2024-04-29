import 'package:dermabyte/Features/Authentication/Data/Models/schedule.dart';

class DoctorModel {
    String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? city;
  String? country;
  String? about;
  String? educationAndExperience;
  List<dynamic>? license;
  String? email;
  String? password;
  String? profilePic;
  bool? state;
  bool? active;
  String? slug;
  String? role;
  int? ratingsQuantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? reviews;
  List<Schedule>? schedules;


  DoctorModel({
    
     this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.city,
    this.country,
    this.about,
    this.educationAndExperience,
    this.license,
    this.email,
    this.password,
    this.profilePic,
    this.state,
    this.active,
    this.slug,
    this.role,
    this.ratingsQuantity,
    this.createdAt,
    this.updatedAt,
    this.reviews,
    this.schedules,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
         firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      about: json['about'] as String?,
      educationAndExperience: json['educationAndExperience'] as String?,
      license: json['license'] as List<dynamic>?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      profilePic: json['profilePic'] as String?,
      state: json['state'] as bool?,
      active: json['active'] as bool?,
      slug: json['slug'] as String?,
      role: json['role'] as String?,
      ratingsQuantity: json['ratingsQuantity'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      reviews: json['reviews'] as List<dynamic>?,
      schedules: (json['Schedules'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
       'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'city': city,
        'country': country,
        'about': about,
        'educationAndExperience': educationAndExperience,
        'license': license,
        'email': email,
        'password': password,
        'profilePic': profilePic,
        'state': state,
        'active': active,
        'slug': slug,
        'role': role,
        'ratingsQuantity': ratingsQuantity,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'reviews': reviews,
        'Schedules': schedules?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
