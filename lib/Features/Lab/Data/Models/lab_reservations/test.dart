import 'lab.dart';

class Test {
  String? name;
  Lab? lab;
  int? cost;

  Test({this.name, this.lab, this.cost});

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        name: json['name'] as String?,
        lab: json['lab'] == null
            ? null
            : Lab.fromJson(json['lab'] as Map<String, dynamic>),
        cost: json['cost'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'lab': lab?.toJson(),
        'cost': cost,
      };
}
