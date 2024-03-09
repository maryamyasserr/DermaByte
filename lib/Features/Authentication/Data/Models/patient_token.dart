import 'package:dermabyte/Features/Authentication/Data/Models/patient.dart';

class PatientTokenModel {
  final PatientModel patient;
  final String token;

  factory PatientTokenModel.fromJson(json) {
    return PatientTokenModel(
        patient: PatientModel.fromJson(json['data']), token: json['token']);
  }
  PatientTokenModel({required this.patient, required this.token});
}
