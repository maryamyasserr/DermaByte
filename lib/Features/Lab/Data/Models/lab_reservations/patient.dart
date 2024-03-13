class Patient {
  String? firstName;
  String? lastName;
  dynamic id;

  Patient({this.firstName, this.lastName, this.id});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        id: json['id'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'id': id,
      };
}
