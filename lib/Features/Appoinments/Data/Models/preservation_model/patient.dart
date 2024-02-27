class Patient {
  String? id;
  String firstName;
  String lastName;

  Patient({this.id, required this.firstName,required this.lastName});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
      };
}
