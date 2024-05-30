import 'package:dermabyte/Features/Authentication/Data/Models/admin_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/user_model.dart';

class AdminToken extends UserModel {
  final AdminModel adminModel;
  final String token;

  factory AdminToken.fromJson(json) {
    return AdminToken(
        adminModel: AdminModel.fromJson(json['data']), token: json['token']);
  }
  AdminToken({required this.adminModel, required this.token});
}
