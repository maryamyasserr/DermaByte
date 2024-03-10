import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/user_model.dart';

class DoctorToken extends UserModel {
  final DoctorModel doctorModel;
  final String token;

  factory DoctorToken.fromJson(json) {
    return DoctorToken(
        doctorModel: DoctorModel.fromJson(json['data']), token: json['token']);
  }
  DoctorToken({required this.doctorModel, required this.token});
}
