class PatientModel {
  String firstName;
  String lastName;
  int age;
  String mobile;
  String city;
  String country;
  String email;
  int password;
  int passwordConfirm;
  DateTime? createdAt;
  DateTime? updatedAt;

  PatientModel(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.mobile,
      required this.city,
      required this.country,
      required this.email,
      required this.password,
      required this.passwordConfirm,
      this.createdAt,
      this.updatedAt});

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int,
      mobile: json['mobile'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      password: json['password'] as int,
      passwordConfirm: json['passwordConfirm'] as int,
      createdAt: json['createdAt'] as DateTime?,
      updatedAt: json['updatedAt'] as DateTime?);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'mobile': mobile,
        'city': city,
        'country': country,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
