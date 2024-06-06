class Lab {
  String? id;
  String? firstName;
  String? profilePic;

  Lab({this.id, this.firstName, this.profilePic});

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        firstName: json['firstName'] as String?,
        profilePic: json['profilePic'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'profilePic': profilePic,
        'id': id,
      };
}
