class Lab {
  String? id;

  Lab({this.id});

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(

        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
