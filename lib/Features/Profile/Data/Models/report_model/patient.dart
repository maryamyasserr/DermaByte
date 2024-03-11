class Patient {
  String? firstName;
  String? lastName;
  int? age;
  String? id;

  Patient({this.id, this.firstName, this.lastName, this.age,});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        age: json['age'] as int?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'id': id,
      };
}
