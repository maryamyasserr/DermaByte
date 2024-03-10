class Dermatologist {
  String? firstName;
  String? lastName;
  String? id;

  Dermatologist({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory Dermatologist.fromJson(Map<String, dynamic> json) => Dermatologist(
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
