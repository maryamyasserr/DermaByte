class DoctorModel {
  String firstName;
  String lastName;
  String mobile;
  String location;
  String city;
  String country;
  String specialization;
  String license;
  String email;
  String password;
  String passwordConfirm;
  String profilePic;
  int sessionCost;
  bool state;
  DateTime? createdAt;
  DateTime? updatedAt;

  DoctorModel(
      {required this.firstName,
      required this.lastName,
      required this.mobile,
      required this.location,
      required this.city,
      required this.country,
      required this.specialization,
      required this.license,
      required this.email,
      required this.password,
      required this.passwordConfirm,
      required this.profilePic,
      required this.sessionCost,
      required this.state,
      this.createdAt,
      this.updatedAt});

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobile: json['mobile'] as String,
      location: json['location'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      specialization: json['specialization'] as String,
      license: json['license'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
      profilePic: json['profilePic'] as String,
      sessionCost: json['sessionCost'] as int,
      state: json['state'] as bool,
      createdAt: json['createdAt'] as DateTime?,
      updatedAt: json['updatedAt'] as DateTime?);

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
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
