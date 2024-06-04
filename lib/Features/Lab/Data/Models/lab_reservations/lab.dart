class Lab {
  String? firstName;
  String? profilePic;
  dynamic id;

  Lab({this.firstName, this.profilePic, this.id});

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        firstName: json['firstName'] as String?,
        profilePic: json['profilePic'] as String?,
        id: json['id'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'profilePic': profilePic,
        'id': id,
      };
}
