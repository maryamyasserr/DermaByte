class Patient {
  String? id;
  String? firstName;
  String? lastName;
  int? age;


  Patient({this.id, this.firstName, this.lastName, this.age,});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        age: json['age'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
      };
}
