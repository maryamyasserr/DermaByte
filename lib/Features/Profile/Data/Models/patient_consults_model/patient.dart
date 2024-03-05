class Patient {
  String? id;
  String? firstName;
  String? lastName;
  int? age;
  String? photo;

  Patient({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.photo,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        age: json['age'] as int?,
        photo: json['photo'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'photo': photo,
        'id': id,
      };
}
