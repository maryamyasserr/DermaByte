class Dermatologist {
  String? id;
  String? firstName;
  String? lastName;
  String? profilePic;

  Dermatologist({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePic,
  });

  factory Dermatologist.fromJson(Map<String, dynamic> json) => Dermatologist(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        profilePic: json['profilePic'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'profilePic': profilePic,
        'id': id,
      };
}
