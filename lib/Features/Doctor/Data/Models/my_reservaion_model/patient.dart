class Patient {
  String? firstName;
  String? lastName;
  String? id;

  Patient({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'id': id,
      };
}
