class Lab {
  String? name;
  dynamic id;

  Lab({this.name, this.id});

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        name: json['name'] as String?,
        id: json['id'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
