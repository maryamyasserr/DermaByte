class PatientModel {
  dynamic id;
  String firstName;
  String lastName;
  int age;
  String mobile;
  String city;
  String country;
  String email;
  String password;
  String passwordConfirm;
  String gender;

  PatientModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.mobile,
    required this.city,
    required this.country,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.gender
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        id: json['id'] as dynamic,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        age: json['age'] as int,
        mobile: json['mobile'] as String,
        city: json['city'] as String,
        country: json['country'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        passwordConfirm: json['passwordConfirm'] as String,
        gender: json['gender'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'mobile': mobile,
        'city': city,
        'country': country,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'gender':gender
      };
}
