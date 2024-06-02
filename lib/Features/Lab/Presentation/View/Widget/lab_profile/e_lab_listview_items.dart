import 'package:dermabyte/Core/Widgets/update_dialog_1textfield.dart';
import 'package:dermabyte/Core/Widgets/update_profile_three_validator.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model/lab_model.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_profile/e_lab_profile_item.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Update%20Lab%20Profile/update_lab_profile_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ElabItemsListView extends StatelessWidget {
  const ElabItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    LabModel lab = BlocProvider.of<AuthCubit>(context).labModel!.lab;
    String labToken = BlocProvider.of<AuthCubit>(context).labModel!.token;
    final List<ProfileItemModel> items = [
       ProfileItemModel(
          title: 'Lab Name',
          onTap: () {
            TextEditingController labNameController = TextEditingController();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfileOne(
                    hintText: lab.firstName!,
                    title: 'Lab Name',
                    controller: labNameController,
                    onPressed: () async {
                      if (labNameController.text.isEmpty) {
                        GoRouter.of(context).pop();
                      } else {
                        GoRouter.of(context).pop();
                        FormData formData = FormData();
                        formData.fields.addAll([
                          MapEntry('firstName', labNameController.text),
                        ]);
                        await BlocProvider.of<UpdateLabProfileCubit>(context)
                            .updateLabProfile(token: labToken, body: formData);
                        lab.firstName = labNameController.text;
                      }
                    },
                  );
                });
          }),
      ProfileItemModel(
          title: 'email',
          onTap: () {
            TextEditingController emailController = TextEditingController();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfileOne(
                    hintText: lab.email!,
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
                        await BlocProvider.of<UpdateLabProfileCubit>(context)
                            .updateLabProfile(token: labToken, body: formData);
                        lab.email = emailController.text;
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

                        await BlocProvider.of<UpdateLabProfileCubit>(context)
                            .changeLabPassword(token: labToken, body: formData);
                      }
                    },
                  );
                });
          }),
      ProfileItemModel(
          title: 'Log Out',
          onTap: () {
            BlocProvider.of<AuthCubit>(context).labModel = null;
            GoRouter.of(context).pushReplacement(AppRoutes.kSignIn);
          })
    ];
    return Column(
      children: items
          .map((e) => ElabProfileItem(
                profileItemModel: e,
                onTap: e.onTap,
              ))
          .toList(),
    );
  }
}
