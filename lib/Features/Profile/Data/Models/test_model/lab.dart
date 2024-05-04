class Lab {
  String? id;
  String? name;
  String? profilePic;
  String? location;

  Lab({this.id, this.name, this.profilePic, this.location});

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        name: json['firstName'] as String?,
        profilePic: json['profilePic'] as String?,
        location: json['location'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': name,
        'profilePic': profilePic,
        'location': location,
        'id': id,
      };
}


