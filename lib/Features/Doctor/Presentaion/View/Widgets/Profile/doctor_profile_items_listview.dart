import 'package:dermabyte/Core/Widgets/update_dialog_1textfield.dart';
import 'package:dermabyte/Core/Widgets/update_profile_three_validator.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update%20Doctor%20Profile/update_doctor_profile_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/doctor_profile_item.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorProfileItems extends StatelessWidget {
  const DoctorProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    DoctorModel doctorModel =
        BlocProvider.of<AuthCubit>(context).doctorModel!.doctorModel;
    String doctorToken = BlocProvider.of<AuthCubit>(context).doctorModel!.token;
    final List<ProfileItemModel> items = [
      ProfileItemModel(
          title: 'email',
          onTap: () {
            TextEditingController emailController = TextEditingController();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfileOne(
                    hintText: doctorModel.email!,
                    title: 'Email',
                    controller: emailController,
                    onPressed: () async {
                      if (emailController.text.isEmpty) {
                        GoRouter.of(context).pop();
                      } else {
                        GoRouter.of(context).pop();
                        FormData formData = FormData();
                        formData.fields.addAll([
                          MapEntry('email', emailController.text),
                        ]);
                        await BlocProvider.of<UpdateDoctorProfileCubit>(context)
                            .updateDoctorProfile(
                                token: doctorToken, body: formData);
                        doctorModel.email = emailController.text;
                      }
                    },
                  );
                });
          }),
      ProfileItemModel(
          title: 'Password',
          onTap: () {
            TextEditingController oldPasswordController =
                TextEditingController();
            TextEditingController newPasswordController =
                TextEditingController();
            TextEditingController confirmPasswordController =
                TextEditingController();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfile3(
                    formKey: formKey,
                    hintText: 'Current Password',
                    title: 'Password',
                    controller1: oldPasswordController,
                    controller2: newPasswordController,
                    controller3: confirmPasswordController,
                    validator1: (currentPassword) {
                      if (currentPassword == null || currentPassword.isEmpty) {
                        return "Current Password is Required";
                      } else {
                        return null;
                      }
                    },
                    validator2: (newPassword) {
                      if (newPassword == null || newPassword.isEmpty) {
                        return "New Password is Required";
                      } else if (newPassword.length < 6) {
                        return 'At least 6 characters';
                      } else {
                        return null;
                      }
                    },
                    validator3: (confirmPassword) {
                      if (confirmPassword == null || confirmPassword.isEmpty) {
                        return "Confirm Password is Required";
                      }
                      if (newPasswordController.text !=
                          confirmPasswordController.text) {
                        return "Password Doesn't Match";
                      } else {
                        return null;
                      }
                    },
                    hintText2: 'New Password',
                    hintText3: 'Confirm password',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).pop();
                        FormData formData = FormData();
                        formData.fields.addAll([
                          MapEntry(
                              'currentPassword', oldPasswordController.text),
                          MapEntry('passwordConfirm',
                              confirmPasswordController.text),
                          MapEntry('password', newPasswordController.text),
                        ]);

                        await BlocProvider.of<UpdateDoctorProfileCubit>(context)
                            .changeDoctorPassword(
                                token: doctorToken, body: formData);
                      }
                    },
                  );
                });
          }),
      ProfileItemModel(
          title: 'My Schedule',
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kMySchedule);
          }),
      ProfileItemModel(
          title: 'My Free Times',
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kMyFreeTimes);
          }),
      ProfileItemModel(
          title: 'Log Out',
          onTap: () {
            BlocProvider.of<AuthCubit>(context).doctorModel = null;
            GoRouter.of(context).pushReplacement(AppRoutes.kSignIn);
          })
    ];
    return Column(
      children: items.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DoctorProfileItem(
            profileItemModel: e,
            onTap: e.onTap,
          ),
        );
      }).toList(),
    );
  }
}
