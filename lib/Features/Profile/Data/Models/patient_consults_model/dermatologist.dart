class Dermatologist {
  String? firstName;
  String? lastName;
  dynamic id;

  Dermatologist({this.firstName, this.lastName, this.id});

  factory Dermatologist.fromJson(Map<String, dynamic> json) => Dermatologist(
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
