class DoctorModel {
  String? firstName;
  String? lastName;
  String? mobile;
  String? location;
  String? city;
  String? country;
  String? specialization;
  String? license;
  String? email;
  String? password;
  String? passwordConfirm;
  String? profilePic;
  int? sessionCost;
  bool? state;

  DoctorModel({
    this.firstName,
    this.lastName,
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
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        mobile: json['mobile'] as String?,
        location: json['location'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        specialization: json['specialization'] as String?,
        license: json['license'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        passwordConfirm: json['passwordConfirm'] as String?,
        profilePic: json['profilePic'] as String?,
        sessionCost: json['sessionCost'] as int?,
        state: json['state'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
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
      };
}
