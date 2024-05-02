class Patient {
  String? id;
  String? profilePic;
  String? firstName;
  String? lastName;
  int? age;

  Patient({
    this.id,
    this.profilePic,
    this.firstName,
    this.lastName,
    this.age,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        profilePic: json['profilePic'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        age: json['age'] as int?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'profilePic': profilePic,
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'id': id,
      };
}
