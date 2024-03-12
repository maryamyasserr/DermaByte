import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/user_model.dart';

class LabToken extends UserModel {
  final LabModel lab;
  final String token;

  LabToken({required this.lab, required this.token});

  factory LabToken.fromJson(json) {
    return LabToken(lab: LabModel.fromJson(json['data']), token: json['token']);
  }
}
