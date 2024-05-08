class Lab {
  String? id;
  String? firstName;
  String? profilePic;
  String? location;

  Lab({
    this.id,
    this.firstName,
    this.profilePic,
    this.location,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        firstName: json['firstName'] as String?,
        profilePic: json['profilePic'] as String?,
        location: json['location'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'profilePic': profilePic,
        'location': location,
        'id': id,
      };
}
