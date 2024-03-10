import 'package:dermabyte/Features/Authentication/Data/Models/patient.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/user_model.dart';

class PatientTokenModel extends UserModel {
  final PatientModel patient;
  final String token;

  factory PatientTokenModel.fromJson(json) {
    return PatientTokenModel(
        patient: PatientModel.fromJson(json['data']), token: json['token']);
  }
  PatientTokenModel({required this.patient, required this.token});
}
