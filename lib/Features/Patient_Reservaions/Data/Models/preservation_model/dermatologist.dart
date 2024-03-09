class Dermatologist {
  String? id;
  String firstName;
  String lastName;

  Dermatologist({this.id, required this.firstName, required this.lastName});

  factory Dermatologist.fromJson(Map<String, dynamic> json) => Dermatologist(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
      };
}
