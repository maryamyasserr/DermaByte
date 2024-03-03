class Lab {
  String name;
  String location;
  dynamic id;

  Lab({required this.name, required this.location, this.id});

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        name: json['name'] as String,
        location: json['location'] as String,
        id: json['id'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'location':location,
        'id': id,
      };
}
