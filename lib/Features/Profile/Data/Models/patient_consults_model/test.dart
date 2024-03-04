class Test {
  String? testName;
  DateTime? requestedAt;
  String? id;

  Test({this.testName, this.requestedAt, this.id});

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        testName: json['testName'] as String?,
        requestedAt: json['requestedAt'] == null
            ? null
            : DateTime.parse(json['requestedAt'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'testName': testName,
        'requestedAt': requestedAt?.toIso8601String(),
        'id': id,
      };
}
