class Patient {
  String? firstName;
  String? lastName;
  int? age;
  String? photo;
  String? id;

  

  Patient({this.firstName, this.lastName, this.age, this.photo, this.id});

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
