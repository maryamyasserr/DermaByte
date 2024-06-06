class Dermatologist {
  String? id;
  String firstName;
  String lastName;
  String? profilePic;

  Dermatologist({this.id, required this.firstName, required this.lastName,this.profilePic});

  factory Dermatologist.fromJson(Map<String, dynamic> json) => Dermatologist(
        id: json['id'] as String?,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        profilePic: json['lastName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'profilePic':profilePic
      };
}
