import 'package:dermabyte/Core/Widgets/update_dialog_1textfield.dart';
import 'package:dermabyte/Core/Widgets/update_profile_three_validator.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Models/profile_item_model.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Profile/profile_item.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Update%20Patient%20Profile/update_patient_profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    PatientModel patient = BlocProvider.of<AuthCubit>(context).patient!.patient;
    String patientToken = BlocProvider.of<AuthCubit>(context).patient!.token;
    final List<ProfileItemModel> items = [
      ProfileItemModel(
          title: 'First Name',
          onTap: () {
            TextEditingController firstNameController = TextEditingController();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfileOne(
                    hintText: patient.firstName!,
                    title: 'First Name',
                    controller: firstNameController,
                    onPressed: () async {
                      if (firstNameController.text.isEmpty) {
                        GoRouter.of(context).pop();
                      } else {
                        GoRouter.of(context).pop();
                        FormData formData = FormData();
                        formData.fields.addAll([
                          MapEntry('firstName', firstNameController.text),
                        ]);
                        await BlocProvider.of<UpdatePatientProfileCubit>(
                                context)
                            .updatePatientProfile(
                                token: patientToken, body: formData);
                        patient.firstName = firstNameController.text;
                      }
                    },
                  );
                });
          }),
      ProfileItemModel(
          title: 'Last Name',
          onTap: () {
            TextEditingController lastNameController = TextEditingController();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateProfileOne(
                    hintText: patient.lastName!,
                    title: 'Last Name',
                    controller: lastNameController,
                    onPressed: () async {
                      if (lastNameController.text.isEmpty) {
                        GoRouter.of(context).pop();
                      } else {
                        GoRouter.of(context).pop();
                        FormData formData = FormData();
                        formData.fields.addAll([
                          MapEntry('lastName', lastNameController.text),
                        ]);
                        await BlocProvider.of<UpdatePatientProfileCubit>(
                                context)
                            .updatePatientProfile(
                                token: patientToken, body: formData);
                        patient.lastName = lastNameController.text;
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
                    hintText: patient.email!,
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
                        await BlocProvider.of<UpdatePatientProfileCubit>(
                                context)
                            .updatePatientProfile(
                                token: patientToken, body: formData);
                        patient.email = emailController.text;
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
                        await BlocProvider.of<UpdatePatientProfileCubit>(
                                context)
                            .changePatientPassword(token: patientToken, body: {
                          'currentPassword': oldPasswordController.text,
                          'passwordConfirm': confirmPasswordController.text,
                          'password': newPasswordController.text
                        });
                      }
                    },
                  );
                });
          }),
      ProfileItemModel(
          title: 'Log Out',
          onTap: () {
            BlocProvider.of<AuthCubit>(context).patient = null;
            GoRouter.of(context).go(AppRoutes.kSignIn);            
          })
    ];
    return Column(
      children: items.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ProfileItem(
            profileItemModel: e,
          ),
        );
      }).toList(),
    );
  }
}
