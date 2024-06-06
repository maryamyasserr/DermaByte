

import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/lab.dart';

class Test {
  String? id;
  String? name;
  Lab? lab;
  int? cost;

  Test({this.id, this.name, this.lab, this.cost});

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        name: json['name'] as String?,
        lab: json['lab'] == null
            ? null
            : Lab.fromJson(json['lab'] as Map<String, dynamic>),
        cost: json['cost'] as int?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'lab': lab?.toJson(),
        'cost': cost,
        'id': id,
      };
}
