class Lab {
  String? id;
  String? name;

  Lab({this.id, this.name});

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        id: json['_id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {'_id': id, 'name': name};
}
