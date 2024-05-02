class Patient {
  String? id;
  String? profilePic;
  String? firstName;
  String? lastName;
  String? email;

  Patient({
    this.id,
    this.profilePic,
    this.firstName,
    this.lastName,
    this.email,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        profilePic: json['profilePic'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'profilePic': profilePic,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'id': id,
      };
}
