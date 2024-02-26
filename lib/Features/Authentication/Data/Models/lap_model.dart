class LapModel {
  String? name;
  String? mobile;
  String? location;
  String? city;
  String? country;
  String? license;
  String? email;
  String? password;
  String? passwordConfirm;
  bool? state;

  LapModel({
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
  });

  factory LapModel.fromJson(Map<String, dynamic> json) => LapModel(
        name: json['name'] as String?,
        mobile: json['mobile'] as String?,
        location: json['location'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        license: json['license'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        passwordConfirm: json['passwordConfirm'] as String?,
        state: json['state'] as bool?,
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
      };
}
